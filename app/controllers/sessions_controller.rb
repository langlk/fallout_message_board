class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      auth_command = AuthorizeUser.call(user.email, params[:password])
      if auth_command.success?
        session[:token] = auth_command.result['auth_token']
        flash[:notice] = "Welcome back, #{user.name}!"
        redirect_to root_path
      else
        flash[:alert] = "API authentication failed!"
        redirect_to '/signin'
      end
    else
      flash[:alert] = user.errors.full_messages
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:token] = nil
    flash[:notice] = "You've signed out!"
    redirect_to root_path
  end
end
