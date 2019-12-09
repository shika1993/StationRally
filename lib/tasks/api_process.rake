namespace :api_process do
  desc "APIからデータを取得してDBに保存する"
  task make_stations_table: :environment do
    class TrainAPI
      BASE_URL = 'https://api-tokyochallenge.odpt.org/api/v4/odpt:'
      CONSUMER_KEY= Rails.application.secrets.opd_api_key
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
        station_name_ja = jr_station["odpt:stationTitle"]["ja"]
        station_name_en = jr_station["odpt:stationTitle"]["en"]
        station_name_en.delete!("-")
        station_geolat =jr_station["geo:lat"]
        station_geolong =jr_station["geo:long"]
        Station.create(name: station_name_ja, geolat:station_geolat, geolong:station_geolong, en_name: station_name_en)
      end
    end
  end
  task make_points_table: :environment do
    class TrainAPI
      BASE_URL = 'https://api-tokyochallenge.odpt.org/api/v4/odpt:'
      CONSUMER_KEY= '50a113cab20c68f9a450096237edb1ebc2bba14c075ac6687a19781781e5b2db'
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
    class StationAPI < TrainAPI
      PATH = 'PassengerSurvey'
      def self.fetch(params)
        make_get_request(PATH, params)
      end
    end
    @passengersurveys = StationAPI.fetch({'odpt:operator': 'odpt.Operator:JR-East'})
    @passengersurveys.each do |passengersurvey|
      @name = passengersurvey["owl:sameAs"]
      @name[0, 29] = ""
      @passenger = passengersurvey["odpt:passengerSurveyObject"][0]["odpt:passengerJourneys"]
      @point1 = @passenger*(-1) + 751018
      @point2 = @point1.ceil(-3)
      Point.create(en_name: @name, points: @point2, passenger: @passenger)
    end
  end
end