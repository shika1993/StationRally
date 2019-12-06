class MapsController < ApplicationController
  class TrainAPI
    BASE_URL = 'https://api-tokyochallenge.odpt.org/api/v4/odpt:'
    CONSUMER_KEY= '84cf17c58ece1106249c0a4b4ab209383af75565034fd03070b13c6361baa14f'
    def self.make_get_request(path, params)
      url = BASE_URL + path
      conn = Faraday.new(url)
      res = conn.get do |req|
        req.params['acl:consumerKey'] = CONSUMER_KEY
        params.each do |key, value|
        req.params[key] = value
        end
      end
      return JSON.parse(res.body)
    end
  end
  class StationsAPI < TrainAPI
    PATH = 'Station'
    def self.fetch(params)
      make_get_request(PATH, params)
    end
  end
  def index
    geo_west = 139.59928
    geo_east = 139.88175
    geo_north = 35.79100
    geo_south = 35.56214
    @jr_stations = StationsAPI.fetch({'odpt:operator': 'odpt.Operator:JR-East'})
    @jr_stations.each do |jr_station|
      if jr_station["geo:lat"] <= geo_north  && jr_station["geo:lat"] >= geo_south && jr_station["geo:long"] <= geo_east && jr_station["geo:long"] >= geo_west
        station_name = jr_station["odpt:stationTitle"]["en"]
        station_name.delete!("-")
        station_geolat =jr_station["geo:lat"]
        station_geolong =jr_station["geo:long"]
        #Station.create(name: station_name, geolat:station_geolat, geolong:station_geolong)
      end
    end
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
    #binding.pry
  end
  def show
  end
end
