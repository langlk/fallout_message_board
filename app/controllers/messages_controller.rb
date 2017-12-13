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

  def edit
    command = GetGroups.call(params[:group_id])
    message_command = GetMessages.call(params[:group_id])
    if command.success?
      @group = command.result
      if message_command.success?
        @messages = message_command.result
        @edit_message_id = params[:id].to_i
        render template: 'groups/show'
      else
        flash[:alert] = "Error obtaining messages."
        @messages = []
      end
    else
      flash[:alert] = "Group not found."
      redirect_to groups_path
    end
  end

  def update
    message_command = UpdateMessage.call(params[:group_id], params[:id], session[:token], params[:content])
    if message_command.success?
      flash[:notice] = "Message updated successfully!"
      redirect_to "/groups/#{params[:group_id]}"
    else
      flash[:alert] = message_command.errors[:message]
      redirect_to groups_path
    end
  end
end
