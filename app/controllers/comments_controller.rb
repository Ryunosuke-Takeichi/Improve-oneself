class CommentsController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render tweet_path
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :tweet_id, :user_id)
  end
end
