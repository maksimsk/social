class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @user_publics = PublicUser.where(user: @user)
    @user_likes = Like.where(user_id: @user.id)

    @posts = []
    @user_publics.each do |public|
      Public.find(public.public_id).posts.each do |post|
        @posts << post
      end
    end
    @posts = @posts.reverse
  end
end
