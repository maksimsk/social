class DashboardController < ApplicationController

  before_action :authenticate_user!
  def index
    @user = current_user
    @user_publics = PublicUser.where(user: @user)
    p @user_publics
  end
end
