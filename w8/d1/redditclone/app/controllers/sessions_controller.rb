class SessionsController < ApplicationController
    before_action :require_logged_in, only: [:destroy]

    def new
        render :new
    end
    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user
            login!(@user)
            redirect_to subs_url # change later if need be
        else
            flash.now[:errors] = ['Invalid username or password']
            render :new
        end
    end
    def destroy
        logout!
        render :new
    end
end
