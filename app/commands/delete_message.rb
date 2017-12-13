class DeleteMessage
  prepend SimpleCommand

  def initialize(group_id, message_id, user_token)
    @group_id = group_id
    @message_id = message_id
    @user_token = user_token
  end

  def call
    response = RestClient::Request.execute(
      method: :delete,
      url: "http://localhost:3001/api/v1/groups/#{@group_id}/messages/#{@message_id}/?key=#{ENV['API_KEY']}",
      headers: { Authorization: @user_token }
    )
    result = JSON.parse(response)
  rescue RestClient::NotFound => exception
    errors.add(:message, "Group could not be found.")
    nil
  rescue RestClient::Unauthorized => execute
    errors.add(:message, "User authorization failed.")
    nil
  end
end
