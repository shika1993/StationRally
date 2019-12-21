class MapsController < ApplicationController
  before_action :set_ranking, only: [:index]

  def index
    gon.names = Station.pluck(:name)
    gon.geolats = Station.pluck(:geolat)
    gon.geolongs = Station.pluck(:geolong)
    gon.id = Station.pluck(:id)
    still_station_ids = UsersStation.where("user_id=?",current_user.id).pluck(:station_id).uniq
    still_station_geolats = []
    still_station_geolongs = []
    still_station_names = []
    still_station_ids.each do |still_station_id|
      still_station_geolat = Station.where("id = ?", still_station_id).pluck(:geolat)
      still_station_geolats << still_station_geolat
      still_station_geolong = Station.where("id = ?", still_station_id).pluck(:geolong)
      still_station_geolongs << still_station_geolong
      still_station_name = Station.where("id = ?", still_station_id).pluck(:name)
      still_station_names << still_station_name
    end
    gon.still_station_geolats = still_station_geolats
    gon.still_station_geolongs = still_station_geolongs
    gon.still_station_ids = still_station_ids
    gon.still_station_names = still_station_names
    user_station = UsersStation.where("user_id = ?", current_user.id)
    @gone_station = user_station.select(:station_id).distinct.length
    @rest_station = 76 - @gone_station
    gon.rest_station = @rest_station
    
    station_points = []
    gon.id.each do |id|
      enname = Station.where("id = ?", id).pluck(:en_name)
      point = Point.where("en_name = ?", enname).pluck(:points)
      station_points << point
    end
    gon.station_points = station_points
  end

  def show
  end

  private

  def set_ranking
    @users = User.all.order('points desc') 
      @users.find_each do |user| 
        if user == current_user
          @ranking = @users.index(user) + 1
        end
      else
      end
  end

end

 
