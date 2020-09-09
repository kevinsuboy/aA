class CommentsController < ApplicationController
    def create
        comment = Comment.new(comment_params)
        comment.save
        redirect_to blog_url(comment.blog_id)
    end
    def show
        @user = User.find(params[:id])
        render :show
    end
    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_to blog_url(comment.blog_id)
    end
    private
    def comment_params
        params.require(:comment).permit(:body,:author_id,:blog_id)
    end
end
