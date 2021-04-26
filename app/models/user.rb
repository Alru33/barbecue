class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_USER_REGEX = /\A[a-z0-9_]+\z/i

  has_many :events

  validates :name, presence: true,
            uniqueness: true,
            length: { minimum: 2, maximum: 40 },
            format: { with: VALID_USER_REGEX }

  before_validation :set_name, on: :create

  private

  def set_name
    self.name = "User_#{rand(777)}" if self.name.blank?
  end
end
