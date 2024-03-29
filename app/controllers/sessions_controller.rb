class SessionsController < ApplicationController
  # GET /log_in
  def new
  end

  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect_to user, :notice => "Logged in!"
  	else
  		flash.now.alert = "Invalid email or password"
  		render "new"
  	end
  end

  # DESTROY /log_out
  def destroy
  	session[:user_id] = nil
  	redirect_to new_session_path, :notice => "Logged out!"
  end
end
