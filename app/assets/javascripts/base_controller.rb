class Api::V1::BaseController < ApplicationController
  include Response
  include ResponseErrors
  
  attr_reader :current_user
  before_action :restrict_access

  private
  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:key])
    render json: { error: 'Not Authorized' }, status: :unauthorized unless api_key
  end

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user
  end
end
