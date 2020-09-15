class PostsController < ApplicationController
    before_action :require_logged_in, only:[:create,:new,:edit,:update,:destroy] # === except:[:index,:show]
    # def index
    #     @posts = Post.all
    #     render :index
    # end

    
    def new
        @post = Post.new
        render :new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.sub_id = 0
        if @post.save
            redirect_to post_url(@post) # tries to go to INDEX
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end
    
    def show
        @post = Post.find(params[:id])
        render :show
    end

    def edit
        @post = current_user.posts.find_by(id: params[:id])
        render :edit
    end

    def update
        @post = current_user.posts.find_by(id: params[:id])
        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    # def destroy
    #     @post = current_user.posts.find_by(id: params[:id])

    # end

    # def destroy
    #     @sub = current_user.subs.find_by(id: params[:id])
    #     @sub.user_id = params[:user_id] # for an embedded route (only mod can destroy)
    #     if @sub && @sub.destroy
    #         redirect_to subs_url
    #     end
    # end



    private
    def post_params
        params.require(:post).permit(:title,:url,:content)
    end
end
