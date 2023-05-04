class User < ApplicationRecord
  AVAILABLE_LOCALES = %w[en ru].freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  validates :email, uniqueness: true

  def confirm!
    self.confirmed = true

    save!
  end
end
