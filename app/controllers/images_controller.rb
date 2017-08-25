class ImagesController < ApplicationController

  def create
    image_array.each do |data|
      Image.create(data: data, album_id: album_id)
    end
    redirect_to user_albums_url
  end

  private

  def image_array
    params.require(:image).permit(images: [])[:images]
  end

  def album_id
    params.permit(:album_id)[:album_id]
  end
end
