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
    kanagawa_names = ["向河原","武蔵小杉","武蔵中原","武蔵新城","津田山","武蔵溝ノ口"]
    jr_stations = StationsAPI.fetch({'odpt:operator': 'odpt.Operator:JR-East'})

    jr_stations.each do |jr_station|
      if jr_station["geo:lat"] <= geo_north  && jr_station["geo:lat"] >= geo_south && jr_station["geo:long"] <= geo_east && jr_station["geo:long"] >= geo_west
        if Station.where("name = ?", jr_station["odpt:stationTitle"]["ja"]) == []
          station_name_ja = jr_station["odpt:stationTitle"]["ja"]
          station_name_en = jr_station["odpt:stationTitle"]["en"]
          station_name_en.delete!("-")
          station_geolat = jr_station["geo:lat"]
          station_geolong = jr_station["geo:long"]
          Station.create(name: station_name_ja, geolat:station_geolat, geolong:station_geolong, en_name: station_name_en)
        end
      end
    end
    
    Station.where(name: kanagawa_names).delete_all
    
  end

  task make_points_table: :environment do
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

    class StationAPI < TrainAPI
      PATH = 'PassengerSurvey'
      def self.fetch(params)
        make_get_request(PATH, params)

      end
    end
    
    passengersurveys = StationAPI.fetch({'odpt:operator': 'odpt.Operator:JR-East'})
    jr_stations = StationsAPI.fetch({'odpt:operator': 'odpt.Operator:JR-East'})
    passengersurveys.each do |passengersurvey|
      name = passengersurvey["owl:sameAs"]
      name[0, 29] = ""
      passenger = passengersurvey["odpt:passengerSurveyObject"][0]["odpt:passengerJourneys"]
      point1 = ((((passenger)/1000)*(-1)).round(-2))/100 +9
      if name.include?(".")
        name = name.split(".")[1]
      end
      Point.create(en_name: name, points: point1, passenger: passenger)
    end
  end
end