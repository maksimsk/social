class PublicsController < ApplicationController
  before_action :set_public, only: [:show, :edit, :update, :destroy]


  def index
    @publics = Public.all
    @posts = Post.all.sort_by(&:created_at).reverse
  end

  def show
    @user_likes = Like.where(user_id: current_user.id)
  end

  def new
    @public = Public.new
  end

  def edit
  end

  def create
    @public = Public.new(public_params)

    respond_to do |format|
      if @public.save
        format.html { redirect_to @public, notice: 'Public was successfully created.' }
        format.json { render :show, status: :created, location: @public }
      else
        format.html { render :new }
        format.json { render json: @public.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @public.update(public_params)
        format.html { redirect_to @public, notice: 'Public was successfully updated.' }
        format.json { render :show, status: :ok, location: @public }
      else
        format.html { render :edit }
        format.json { render json: @public.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @public.destroy
    respond_to do |format|
      format.html { redirect_to publics_url, notice: 'Public was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_public
      @public = Public.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def public_params
      params.fetch(:public, {}).permit(:name, :user_id)
    end
end
