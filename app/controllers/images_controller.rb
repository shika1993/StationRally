class ImagesController < ApplicationController
  before_action :set_station 
  before_action :move_to_index, only: [:desteoy]
  def index
    @image = Image.new
    @images = Image.all
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
    image = Image.find(params[:id])
    image.destroy
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
