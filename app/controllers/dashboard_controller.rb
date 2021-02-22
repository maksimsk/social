class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @user_publics = PublicUser.where(user: @user)
    @user_likes = Like.where(user_id: @user.id)
  end
end
