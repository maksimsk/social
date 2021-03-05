class DislikesController < ApplicationController
  before_action :find_post

  def create
    unless Like.find_by(post_id: @post.id, user_id: current_user.id).blank?
      Like.find_by(post_id: @post.id, user_id: current_user.id).delete
    end
    
    if Dislike.find_by(post_id: @post.id, user_id: current_user.id).blank?
      @post.dislikes.create(user_id: current_user.id)
      redirect_back fallback_location: root_path, notice: 'You Disliked the Post'
    else
      redirect_back fallback_location: root_path, notice: 'You have already disliked this post'
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
    p params
  end
end
