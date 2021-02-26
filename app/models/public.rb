class Public < ApplicationRecord
  belongs_to :user
  has_many :public_users, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :name, presence: true
end
