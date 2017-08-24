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
    if album.save
      if image_params
        image_params.each do |data|
          album.images.create(data: data)
        end
      end
    end
    redirect_to user_albums_url
  end

  private

  def album_params
    params.require(:album).permit(:name, :user_id)
  end

  def image_params
    params[:images]
  end
end
