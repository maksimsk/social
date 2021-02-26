class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = current_user
    @user_name = @user.name
    @user.destroy

    if @user.destroy
        redirect_to root_url, notice: "User #{@user_name} was deleted"
    end
  end
end
