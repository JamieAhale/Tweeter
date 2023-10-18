class User < ApplicationRecord
  has_many :tweets
  has_many :likes
  has_many :liked_tweets, through: :likes, source: :tweet
  has_many :comments, dependent: :destroy
  has_one_attached :profile_picture

  attr_accessor :remove_profile_picture

before_save :check_remove_profile_picture

def check_remove_profile_picture
  profile_picture.purge if remove_profile_picture == '1'
end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
