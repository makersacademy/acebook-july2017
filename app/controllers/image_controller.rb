class ImageController < ApplicationController
  def new
    @album = current_user.albums.new
  end

  def create
    p params
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
end
