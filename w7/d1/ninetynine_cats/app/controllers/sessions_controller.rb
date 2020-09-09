class SessionsController < ApplicationController

    def new
        render :new 
    end

    def create
        user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if user.nil?
            render json: 'Credentials were wrong'
        else
            # render json: "Welcome back #{user.username}!"
            user.reset_session_token!
            #Update the session hash with the new session_token.
            login!(user)
            redirect_to cats_url
        end
    end

    def destroy
#         Call #reset_session_token! on current_user to invalidate the old token, but only if there is a current_user. Invalidating the old token guarantees that no one can login with it. This is good practice in case someone has stolen the token.
# Blank out :session_token in the session hash.
        logout!
    end
end
