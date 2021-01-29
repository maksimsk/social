class Post < ApplicationRecord
  belongs_to :user
  belongs_to :public
  has_many :likes
  has_many :dislikes
  has_many :comments
end
