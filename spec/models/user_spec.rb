require 'rails_helper'

describe User, vcr: true do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_presence_of :password_confirmation }
  it { should validate_uniqueness_of :name }
  it { should validate_uniqueness_of :email }
end
