class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_USER_REGEX = /\A[a-z0-9_]+\z/i

  has_many :events

  validates :email, presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true,
            uniqueness: true,
            length: { minimum: 2, maximum: 40 },
            format: { with: VALID_USER_REGEX }
end
