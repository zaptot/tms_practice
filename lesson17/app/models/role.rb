class Role < ApplicationRecord
  USER = 'user'
  ADMIN = 'admin'
  AVAILABLE_ROLES = [USER, ADMIN].freeze

  has_and_belongs_to_many :users, :join_table => :users_roles

  belongs_to :resource,
             :polymorphic => true,
             :optional => true


  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true
  validates :name,
            :inclusion => { :in => AVAILABLE_ROLES },
            allow_nil: false

  scopify
end
