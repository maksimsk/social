class LikesController < ApplicationController
  before_action :find_post

  def create
    unless Dislike.find_by(post_id: @post.id, user_id: current_user.id).blank?
      Dislike.find_by(post_id: @post.id, user_id: current_user.id).delete
    end
    
    if Like.find_by(post_id: @post.id, user_id: current_user.id).blank?
      @post.likes.create(user_id: current_user.id)
      redirect_to root_path, notice: 'You Liked the Post'
    else
      redirect_to root_path, notice: 'You have already liked this post'
    end
  end
  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
