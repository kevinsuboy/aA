class ApplicationController < ActionController::Base

  helper_method: :current_user, :login, :logout

  # CRLLL
  # c: current_user /
  # r: require_logged_in! X
  # l: login! /
  # l: logout! /
  # l: logged_in? X

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_logged_in!
    redirect_to new_session_url if current_user.nil? # go login, if not logged in
  end

  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token
    # when 'login!' is done, the caller wants 'session' (hash) back... for now, * there's a method to the instr's madness *
  end

  def logout!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

end
