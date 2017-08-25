class AlbumsController < ApplicationController
  before_action :authenticate_user!

  def index
    @albums = Album.all
  end

  def new
    @album = current_user.albums.new
  end

  def create
    album = Album.create(album_params)
    redirect_to user_albums_url
  end

  def show
    @album = Album.find(params[:id])
    @image = Image.new
  end

  private

  def album_params
    params.require(:album).permit(:name, :description, :user_id)
  end
end
