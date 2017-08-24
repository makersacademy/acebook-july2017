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
    # if album.save
    #   if image_params
    #     image_params.each do |data|
    #       album.images.create(data: data)
    #     end
    #   end
    # end
    redirect_to user_albums_url
  end

  def show
    @album = Album.find(params[:id])
    @image = Image.new
  end

  private

  def album_params
    params.require(:album).permit(:name, :user_id)
  end

  def image_params
    params[:images]
  end
end
