class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_USER_REGEX = /\A[a-z0-9_]+\z/i

  has_many :events
  has_many :coments
  has_many :subscriptions

  validates :name, presence: true,
            uniqueness: true,
            length: { minimum: 2, maximum: 40 },
            format: { with: VALID_USER_REGEX }

  before_validation :set_name, on: :create
  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  private

  def set_name
    self.name = "User_#{rand(777)}" if self.name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: email).update_all(user_id: id)
  end
end
