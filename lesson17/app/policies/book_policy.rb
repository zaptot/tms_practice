class BookPolicy < ApplicationPolicy
  def update?
    user.has_role?(:admin) || record.user_id == user.id
  end
end
