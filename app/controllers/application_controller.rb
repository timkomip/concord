class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private

  def logged_in?
  	params[:user_id] && params[:user_id] == session[:user_id]
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id]) if User.exists?(session[:user_id])
    end
  end

end
