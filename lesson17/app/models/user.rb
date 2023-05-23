class User < ApplicationRecord
  rolify
  AVAILABLE_LOCALES = %w[en ru].freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :books

  after_create :assign_default_role

  def confirm!
    self.confirmed = true

    save!
  end

  private

  def assign_default_role
    self.add_role(Role::USER) if self.roles.blank?
  end
end
