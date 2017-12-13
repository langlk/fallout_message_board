class UpdateMessage
  prepend SimpleCommand

  def initialize(group_id, message_id, user_token, content)
    @group_id = group_id
    @message_id = message_id
    @user_token = user_token
    @content = content
  end

  def call
    response = RestClient::Request.execute(
      method: :patch,
      url: "http://localhost:3001/api/v1/groups/#{@group_id}/messages/#{@message_id}/?key=#{ENV['API_KEY']}&content=#{@content}",
      headers: { Authorization: @user_token }
    )
    result = JSON.parse(response)
  rescue RestClient::NotFound => exception
    errors.add(:message, "Group could not be found.")
    nil
  rescue RestClient::UnprocessableEntity => exception
    errors.add(:message, "Content cannot be blank.")
    nil
  rescue RestClient::Unauthorized => execute
    errors.add(:message, "User authorization failed.")
    nil
  end
end
