class GetGroups
  prepend SimpleCommand

  def initialize(group_id = nil)
    @group_id = group_id
  end

  def call
    group_id_string = @group_id ? "/#{@group_id}/" : nil
    response = RestClient::Request.execute(
      method: :get,
      url: "http://localhost:3001/api/v1/groups#{group_id_string}?key=#{ENV['API_KEY']}"
    )
    result = JSON.parse(response)
  end
end
