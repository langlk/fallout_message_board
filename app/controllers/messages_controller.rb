class MessagesController < ApplicationController
  before_action :authenticate_user

  def create
    message_command = PostMessage.call(params[:group_id], session[:token], params[:content])
    if message_command.success?
      flash[:notice] = "Message posted successfully!"
      redirect_to "/groups/#{params[:group_id]}"
    else
      flash[:alert] = message_command.errors[:message]
      redirect_to groups_path
    end
  end
end
