require_relative 'base_controller'

class MainController < BaseController
  def index
    [200, { 'Content-type' => 'application/json' }, [{ index: true }.to_json]]
  end

  def hello
    [200, { 'my_first_controller' => 'test_header' }, ['Hello']]
  end
end
