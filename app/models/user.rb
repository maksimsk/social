class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable, :lockable
  has_many :publics
  has_many :public_users
  has_many :likes
  has_many :dislikes
  has_many :posts
  has_many :comments
end
