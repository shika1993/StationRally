class ImagesController < ApplicationController
  before_action :set_station 

  def index
    @image = Images.new
    @images = @station.images.includes(:user)
  end

  def create
    @image = @station.images.new(image_params)
  end

  def new
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def image_params
    params.require(:image).permit(:imege, :text).merge(user_id: current_user.id)
  end

  def set_station
    @station = Station.find(params[:station_id])
  end
end
