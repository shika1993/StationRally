namespace :api_process do
  desc "APIからデータを取得してDBに保存する"
  task station_geo: :environment do
    class TrainAPI
      BASE_URL = 'https://api-tokyochallenge.odpt.org/api/v4/odpt:'
      CONSUMER_KEY= '-'
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
    geo_west = 139.59928
    geo_east = 139.88175
    geo_north = 35.79100
    geo_south = 35.56214
    @jr_stations = StationsAPI.fetch({'odpt:operator': 'odpt.Operator:JR-East'})
    @jr_stations.each do |jr_station|
      if jr_station["geo:lat"] <= geo_north  && jr_station["geo:lat"] >= geo_south && jr_station["geo:long"] <= geo_east && jr_station["geo:long"] >= geo_west
        station_name = jr_station["odpt:stationTitle"]["ja"]
        station_name.delete!("-")
        station_geolat =jr_station["geo:lat"]
        station_geolong =jr_station["geo:long"]
        Station.create(name: station_name, geolat:station_geolat, geolong:station_geolong)
      end
    end
  end

  task station_geo_en: :environment do
    class TrainAPI
      BASE_URL = 'https://api-tokyochallenge.odpt.org/api/v4/odpt:'
      CONSUMER_KEY= '-'
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
        Station.create(name: station_name, geolat:station_geolat, geolong:station_geolong)
      end
    end
  end
end