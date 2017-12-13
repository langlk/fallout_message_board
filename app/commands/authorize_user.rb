class AuthorizeUser
  prepend SimpleCommand

  def initialize(user_email, user_password)
    @email = user_email
    @password = user_password
  end

  def call
    response = RestClient::Request.execute(
      method: :post,
      url: "http://localhost:3001/api/v1/authenticate?key=#{ENV['API_KEY']}&email=#{@email}&password=#{@password}"
    )
    result = JSON.parse(response)
  end
end
