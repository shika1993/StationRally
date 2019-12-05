class ImagesController < ApplicationController
  before_action :set_station 

  def index
    @image = Image.new
    @images = @station.images
    #-@images = @station.images.includes(:user)
  end

  def create
    @image = @station.images.new(image_params)
    if @image.save
      redirect_to station_images_path(@station.id)
    else
      redirect_to station_images_path(@station.id)
    end
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def update
  end

  def destroy
    post = Image.find(params[:station_id])
    post.destroy
    redirect_to root_path
  end

  private

  def image_params
    params.require(:image).permit(:picture, :text).merge(user_id: current_user.id)
  end

  def set_station
    @station = Station.find(params[:station_id])
    #binding.pry
  end
end
