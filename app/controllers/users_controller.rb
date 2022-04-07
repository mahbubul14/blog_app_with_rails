class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    user_signed_in?
    current_user
    user_session
    @users = User.all
    @posts = Post.all
  end

  def show
    @likes = Like.all.includes(:post_id)
    @comments = Comment.all.includes(:post_id).order(created_at: :desc)
    @user = User.find_by(id: params[:id])
  end
end
