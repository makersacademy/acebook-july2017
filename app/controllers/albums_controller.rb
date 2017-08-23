class AlbumsController < ApplicationController
  before_action :authenticate_user!

  def index
    @albums = Album.all
  end

  def new
    @user = current_user
    @album = current_user.albums.new
  end
end
