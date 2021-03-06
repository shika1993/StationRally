require "exifr/jpeg"
class ImagesController < ApplicationController
  before_action :set_station, except: [:destroy]
  before_action :move_to_index, only: [:desteoy]

  def index
    @image = Image.new
    @images = @station.images.order("id DESC")
    @station_id = @station.id
    en_name = @station.en_name
    en_station = Point.where("en_name=?", en_name)
    gon.point = en_station[0][:points]
  end

  def create
    @image = @station.images.new(image_params)
    image_user = @image.user_id
    image_station = @image.station_id
    if @image.save
      UsersStation.create(user_id: image_user, station_id: image_station)
      flag = UsersStation.where(user_id: current_user.id, station_id: @station.id)
      photographTime = Timestamp.last.photograph_at
      photo = Timestamp.last
      photo.update(image_id: @image.id)
      Image.last.update(photograph_at: photographTime)
      @image_time = @image.photograph_at
      if flag.length == 1
        en_name = @station.en_name
        en_station = Point.where("en_name=?", en_name)
        @points = en_station[0][:points]
        get_points = @points + current_user.points
        current_user.update(points: get_points)
        flash[:first_photo] = ""
      else

      end
      redirect_to station_images_path(@station.id)
    else
      flash[:no_photo_flag] = ""
      redirect_to station_images_path(@station.id)
    end
  end

  def new
    @image = Image.new
  end

  def destroy
    image = Image.find(params[:id])
    station_id = image.station_id

    if image.destroy
      respond_to do |format|
        format.json
      end
      if Timestamp.find_by("image_id=?",image.id)
        Timestamp.find_by("image_id=?",image.id).destroy
      end
      if Favorite.find_by("image_id=?",image.id)
        Favorite.find_by("image_id=?",image.id).destroy
      end
    else
 
    end

  end

  private

  def image_params
    params.require(:image).permit(:picture, :text).merge(user_id: current_user.id)

  end
  
  def set_station
    @station = Station.find(params[:station_id])
  
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
    
  end
end
