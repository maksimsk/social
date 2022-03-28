class Post < ApplicationRecord
  belongs_to :user
  belongs_to :public
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  validates_presence_of :title
end
