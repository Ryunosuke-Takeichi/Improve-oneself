class UsersController < ApplicationController
    
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def user_tweets
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: @user.id).all.order("created_at DESC").page(params[:page]).per(20)
  end
  
  def follows
    user = User.find(params[:id])
    @users = user.followings
  end
  
  def followers
    user = User.find(params[:id])
    @users = user.followers
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
