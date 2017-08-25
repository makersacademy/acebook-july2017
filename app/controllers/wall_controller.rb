class WallController < ApplicationController
  before_action :authenticate_user!

  def index
    user = User.find(get_user_id)
    @post = user.posts.new
    @wall_posts = user.posts.reverse_order
  end

  def create
    post = Post.new(post_params)
    current_user.posts << post
    current_user.save
    redirect_to user_wall_index_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def get_user_id
    params.permit(:user_id)[:user_id]
  end
end

#  How about showing the wall for other users?
# user = User.find(params[:id])
# @wall_posts = user.posts.reverse_order
