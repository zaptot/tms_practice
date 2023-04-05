require 'rack'
require 'webrick'
require 'pry'
require 'yaml'
require 'json'

require_relative 'config/connect_database'
require_relative 'config/router'
require_relative 'controllers/base_controller'
require_relative 'controllers/main_controller'
require_relative 'controllers/jokes_controller'
require_relative 'models/category'
require_relative 'models/joke'

class RackApp
  def call(env)
    Router.new.call(env)
  end
end
