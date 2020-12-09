class TweetsController < ApplicationController
  def index
    @user = current_user
    @search = Tweet.search(params[:q])
    @tweets = @search.result.includes(:user).order("created_at DESC").page(params[:page]).per(20)
  end
  
  def new
  end
  
  def create
    Tweet.create(text: tweet_params[:text], user_id: current_user.id)
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
  
  def show_tweets
    @user = current_user
    @tweets = Tweet.where(user_id: @user.id)
  end
  
  private
    def tweet_params
      params.permit(:text)
    end
end
