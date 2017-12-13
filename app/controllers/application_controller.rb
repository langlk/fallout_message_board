class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user
    unless current_user
      flash[:alert] = "You must be logged in to do that."
      redirect_to '/signin'
    end
  end
end
