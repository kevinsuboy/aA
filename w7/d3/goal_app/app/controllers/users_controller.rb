class UsersController < ApplicationController
  def show
    render :show
  end

  def new
    @user = User.new # to prevent "new" partial form from complaining
    #^ above just creates 'empty' ActiveRecord @user
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
