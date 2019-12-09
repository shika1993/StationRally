class ImagesController < ApplicationController
  before_action :set_station, except: [:destroy]
  before_action :move_to_index, only: [:desteoy]
  
  def index
    @image = Image.new
    @images = @station.images
  end

  def create
    @image = @station.images.new(image_params)
    @image_user = @image.user_id
    @image_station = @image.station_id
    UsersStation.create(user_id: @image_user, station_id: @image_station)
    if @image.save
      redirect_to station_images_path(@station.id)
    else
      redirect_to station_images_path(@station.id)
    end
  end

  def new
    @image = Image.new
  end

  def destroy
    image = Image.find(params[:id])
    station_id = image.station_id
    image.destroy
    redirect_to station_images_path(station_id)
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
