class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :styles, dependent: :destroy
  validates :username, presence: true
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :like_stories, through: :likes, source: :style
end
