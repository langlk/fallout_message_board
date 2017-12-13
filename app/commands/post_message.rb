class PostMessage
  prepend SimpleCommand

  def initialize(group_id, user_token, content)
    @group_id = group_id
    @user_token = user_token
    @content = content
  end

  def call
    response = RestClient::Request.execute(
      method: :post,
      url: "http://localhost:3001/api/v1/groups/#{@group_id}/messages?key=#{ENV['API_KEY']}&content=#{@content}",
      headers: { Authorization: @user_token }
    )
    result = JSON.parse(response)
  end
end