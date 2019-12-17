class FavoritesController < ApplicationController

  def index
    favorite_images_id = Favorite.where("user_id = ?", current_user.id).pluck(:image_id)
    @favorite_images = []
    favorite_images_id.each do |favorite_image_id|
      @favorite_images << Image.find_by("id = ?", favorite_image_id)
    end
  end

  def create
    gon.image_id = params[:image_id]
    gon.station_id = params[:station_id]
    if Favorite.where(user_id: current_user.id, image_id: params[:image_id]) == []
      Favorite.create(user_id: current_user.id, image_id: params[:image_id])
      station_id = params[:station_id]
      respond_to do |format|
        format.json
        #format.html redirect_to redirect_to station_images_path(station_id)
      end
      #redirect_to station_images_path(station_id)
      
    else
      image = Favorite.find_by(user_id: current_user.id, image_id: params[:image_id])
      station_id = params[:station_id]
      image.destroy
      respond_to do |format|
        format.json
        #format.html redirect_to redirect_to station_images_path(station_id)
      end
      #redirect_to station_images_path(station_id)
    end
  end



end
