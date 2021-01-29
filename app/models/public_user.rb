class PublicUser < ApplicationRecord
  belongs_to :public
  belongs_to :user
end
