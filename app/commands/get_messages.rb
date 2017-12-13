class GetMessages
  prepend SimpleCommand

  def initialize(group_id)
    @group_id = group_id
  end

  def call
    response = RestClient::Request.execute(
      method: :get,
      url: "http://localhost:3001/api/v1/groups/#{@group_id}/messages?key=#{ENV['API_KEY']}"
    )
    result = JSON.parse(response)
  end
end
