class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      auth_command = AuthorizeUser.call(@user.email, @user.password)
      if auth_command.success?
        session[:token] = auth_command.result['auth_token']
        flash[:notice] = "Account created successfully!"
        redirect_to root_path
      else
        flash[:alert] = auth_command.errors[:message]
        redirect_to '/signin'
      end
    else
      flash[:alert] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
