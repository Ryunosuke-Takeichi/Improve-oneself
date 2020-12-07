class UsersController < ApplicationController
    
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
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
