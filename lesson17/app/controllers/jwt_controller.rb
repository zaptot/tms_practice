class JwtController < ApplicationController
  class NotAuthenticated < StandardError; end

  JWT_SECRET = 'test_secret'

  rescue_from ActiveRecord::RecordNotFound do |_e|
    render status: 404, json: { message: 'User not found' }
  end

  rescue_from NotAuthenticated do |e|
    render status: 403, json: { message: e.message }
  end

  private

  def current_user
    return if decoded_token.blank?

    user_id = decoded_token['user_id']
    @user = User.find(user_id)
  end

  def logged_in?
    current_user.present?
  end

  def authenticate_user
    return if logged_in?

    raise NotAuthenticated, 'please log in'
  end

  def encode_token(payload)
    JWT.encode(payload, JWT_SECRET)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    return if auth_header.blank?

    token = auth_header.split(' ').last
    begin
      JWT.decode(token, JWT_SECRET, true, algorithm: 'HS256').first
    rescue JWT::DecodeError
      nil
    end
  end
end
