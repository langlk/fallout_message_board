class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :email, :password, :password_confirmation
  validates_uniqueness_of :name, :email
  before_save :create_api_user

  def create_api_user
    command = CreateUser.call(email, name, password)
    if command.success?
      puts "API User created successfully with key #{command.result['key']}"
    else
      errors.add(:api, "Something went wrong")
    end
  end
end
