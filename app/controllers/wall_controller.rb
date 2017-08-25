class WallController < ApplicationController
  before_action :authenticate_user!

  def index
    user = User.find(get_user_id)
    @wall_posts = user.posts.reverse_order
  end

  private

  def get_user_id
    params.permit(:user_id)[:user_id]
  end
end
