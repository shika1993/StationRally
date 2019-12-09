class ImagesController < ApplicationController
  before_action :set_station, except: [:destroy]
  before_action :move_to_index, only: [:desteoy]
 

  
  def index
    @image = Image.new
    @images = @station.images

  end

  def create
    @image = @station.images.new(image_params)
    image_user = @image.user_id
    image_station = @image.station_id

    if @image.save
      UsersStation.create(user_id: image_user, station_id: image_station)
      flag = UsersStation.where(user_id: current_user.id, station_id:@station.id)

      if flag.length == 1
        en_name = @station.en_name
        en_station = Point.where("en_name=?", en_name)
        @points = en_station[0][:points]
        get_points = @points + current_user.points
        current_user.update(points: get_points)

      else

      end
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
