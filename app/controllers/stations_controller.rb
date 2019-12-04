class StationsController < ApplicationController
  before_action :set_station 

  def index
  end

  def show
    @image = Image.find(params[:id])
  end

  def set_station
    @station = Station.find(params[:id])
  end
end
