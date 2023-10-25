class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :tweet
  has_many :comments, dependent: :destroy
end
