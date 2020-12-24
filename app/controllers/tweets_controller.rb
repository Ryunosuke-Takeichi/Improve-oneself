class TweetsController < ApplicationController
  before_action :authenticate_user!
  def new
    @tweet = Tweet.new
  end

  def index
    @tweets = Tweet.all.search(params[:search]).order(created_at: :desc).page(params[:page]).per(20)
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
    @comment = Comment.new
    @comments = @tweet.comments.order(created_at: :desc)
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    if redirect_to tweets_path
    else 
      redirect_to new_tweet_path
    end
  end
  
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end
  
  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end
    
end
