class SubsController < ApplicationController

    before_action :require_logged_in, except: [:index, :show]

    def index
        @subs = Sub.all
        render :index 
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    
    def new
        @sub = Sub.new
        render :new
    end

    def create    
        @sub = current_user.subs.new(sub_params)
        if @sub.save
            redirect_to sub_url(@sub) # ! when/why to use redirect_to vs render :
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    # def destroy
    #     @sub = current_user.subs.find_by(id: params[:id])
    #     # b/c we need to be signed in, only "my" (current_user) subs can be destroyed
    #     # --> If i want to /sub/7 DELETE, but i don't own 7, don't do anything
    #     if @sub && @sub.destroy
    #         redirect_to subs_url
    #     end
    # end

    def edit
        @sub = current_user.subs.find_by(id: params[:id]) # for an embededded route
        render :edit
    end
    
    def update
        @sub = current_user.subs.find(params[:id])
        # b/c of association, the "subs" are the ones I moderate
        # ! update === update_attributes
        if @sub.update_attributes(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    private

    def sub_params
        params.require(:sub).permit(:title,:description)
    end


end
