class Public < ApplicationRecord
  belongs_to :user
  has_many :public_users
  has_many :posts

  validates :name, presence: true
end
