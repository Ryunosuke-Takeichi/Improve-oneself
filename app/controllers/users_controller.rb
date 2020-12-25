class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @name = User.ransack(params[:q])
    @users = @name.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order(created_at: :desc).page(params[:page]).per(10)
  end

  def following
    user = User.find(params[:id])
    @users = user.followings.page(params[:page]).per(5)
    render 'following'
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers.page(params[:page]).per(5)
    render 'followers'
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if
     redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :height, :weight, :profile_image)
  end
end
