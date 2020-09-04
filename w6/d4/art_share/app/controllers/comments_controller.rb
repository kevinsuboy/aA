require 'byebug'
class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: 422
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end

  def index
    if params.has_key?(:comment)
      if params[:comment].has_key?(:user_id)
        user = User.find(params[:comment][:user_id])
        render json: user.comments
      elsif params[:comment].has_key?(:artwork_id)
        artwork = Artwork.find(params[:comment][:artwork_id])
        render json: artwork.comments
      end
    else
      comments = Comment.all
      render json: comments
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:artwork_id, :user_id, :body)
  end 
end
