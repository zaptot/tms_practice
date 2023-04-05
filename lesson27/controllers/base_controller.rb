class BaseController
  def not_found
    [404, {}, ['Unknown path']]
  end

  def internal_error
    [500, {}, ['Internal Error']]
  end
end
