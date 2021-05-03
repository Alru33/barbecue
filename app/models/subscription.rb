class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/,
    unless: -> { user.present? }

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }

  validate :event_owner, if: -> { user.present? }
  validate :email_is_occupied, if: -> { user.present? }

  def user_name
    user&.name || super
  end

  def user_email
    user&.email || super
  end

  private

  def event_owner
    errors.add(:user_name, :error_user) if user == event.user
  end

  def email_is_occupied
    errors.add(:user_email, :error_email) unless User.exists?(email: user_email)
  end
end
