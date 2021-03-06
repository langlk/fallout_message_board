class CreateUser
  prepend SimpleCommand

  def initialize(user_email, user_name, user_password)
    @email = user_email
    @name = user_name
    @password = user_password
  end

  def call
    response = RestClient::Request.execute(
      method: :post,
      url: "http://localhost:3001/api/v1/users?name=#{@name}&email=#{@email}&password=#{@password}"
    )
    result = JSON.parse(response)
  rescue RestClient::UnprocessableEntity => exception
    errors.add(:message, "API user could not be created.")
    nil
  end
end
