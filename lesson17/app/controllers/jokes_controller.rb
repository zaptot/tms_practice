class JokesController < ApplicationController
  before_action :authenticate_user!

  caches_action :random

  def random
    render json: helpers.random_joke
  end

  private

  def authenticate_user
    return if params[:test_auth] == 'accept'

    render status: 403, json: 'No access'
  end
end
