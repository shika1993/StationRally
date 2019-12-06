class MapsController < ApplicationController

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
  end

  def show
  end
  
end
