require 'pry'

module ActiveRecord
end

class ActiveRecord::Base
  class << self
    def where(params)
      ActiveRecord::Relation.new(model: self).where(params)
    end
  end
end

# :id       :bigint
# :name     :string
# :email    :string
# :password :string
class User < ActiveRecord::Base
  TABLE_NAME = 'users'
end

class ActiveRecord::Relation
  def initialize(model:)
    @model = model
    @params = [] # [[:name, 'Vlad'], [:id, 10], [:email, 'test@gmail.com']]
    @result = nil
  end

  def where(params)
    @params += params.to_a
    self
  end

  def to_sql
    res = ['SELECT * FROM', @model::TABLE_NAME]
    if @params.size > 0
      res << 'WHERE'
      res << @params.map { |condition| condition.join(' = ') }.join(' AND ')
    end
    res << ';'
    res.join(' ')
  end

  def each
    load
    @result.each { |row| yield row }
  end

  def load
    @result = [{name: 'Vlad', id: 10, email: 'test@gmail.com', passowrd: 'test_password'}]
  end
end

binding.pry
users = User.where(name: 'Vlad')
users = users.where(id: 10)
users.where(email: 'test@gmail.com')
users.to_sql # => SELECT * FROM users WHERE name = 'Vlad' AND id = 10 AND email = 'test@gmail.com';