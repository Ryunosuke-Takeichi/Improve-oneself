class FollowRelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = User.find(params[:follow_relationship][:following_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = User.find(params[:follow_relationship][:following_id])
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end
end
