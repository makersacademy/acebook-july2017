class AlbumsController < ApplicationController
  before_action :authenticate_user!

  def index
    @albums = Album.all
  end

  def new
    @user = current_user
    @album = current_user.albums.new
  end

  def create
    album = Album.new(album_params)
    current_user.albums << album
    current_user.save
    redirect_to 
  end

  private

  def album_params
    params.require(:album).permit(:name)
  end
end
