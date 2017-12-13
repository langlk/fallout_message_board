class GroupsController < ApplicationController
  def index
    command = GetGroups.call

    if command.success?
      @groups = command.result
    else
      flash[:alert] = "Groups unavailable at this time."
      @groups = []
    end
  end

  def show
    command = GetGroups.call(params[:id])
    message_command = GetMessages.call(params[:id])
    if command.success?
      @group = command.result
      if message_command.success?
        @messages = message_command.result
      else
        flash[:alert] = "Error obtaining messages."
        @messages = []
      end
    else
      flash[:alert] = "Group not found."
      redirect_to groups_path
    end
  end
end
