class Style < ApplicationRecord
  belongs_to :user
  has_many :comments
  attachment :image
  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end
  has_many :likes, dependent: :destroy
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
  
end
