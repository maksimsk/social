class PublicUsersController < ApplicationController

  def create
    @public = Public.find(params[:public_id])
    @public_sub = PublicUser.new(public_id: params[:public_id], user_id: current_user.id)

    respond_to do |format|
      if @public_sub.save
        format.html { redirect_to @public, notice: "You are now subscribed to the #{@public.name}" }
        format.json { render :show, status: :created, location: @public }
      else
        format.html { redirect_to @public, notice: 'Something went wrong :/' }
        format.json { render json: @public_sub.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @public = Public.find(params[:public_id])
    @public_user = PublicUser.find_by(public_id: params[:public_id], user_id: current_user.id)
    
    respond_to do |format|
      if @public_user.delete
        format.html { redirect_to @public, notice: "You have unsubscribed from the #{@public.name}" }
        format.json { render :show, status: 200, location: @public }
      else
        format.html { redirect_to @public, notice: 'Something went wrong :/' }
        format.json { render json: @public_user.errors, status: :unprocessable_entity }
      end
    end
  end
end
