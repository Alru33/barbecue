class Hashtag < ApplicationRecord
  has_and_belong_to_many :questions
end