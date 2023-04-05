class Router
  ROUTES_FILE_NAME = 'routes.yml'
  ROUTES_PATH = File.join(File.dirname(__FILE__ ), ROUTES_FILE_NAME)
  ROUTES = YAML.load(File.read(ROUTES_PATH))

  def call(env)
    if ROUTES[env['PATH_INFO']]
      controller_name, action = ROUTES[env['PATH_INFO']].split('#')
      controller = [controller_name.capitalize, 'Controller'].join
      Object.const_get(controller).new.public_send(action)
    else
      BaseController.new.not_found
    end
  rescue Exception => _
    BaseController.new.internal_error
  end
end
