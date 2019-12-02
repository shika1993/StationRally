class Station < ApplicationRecord
  has_many :images
  has_many :users_stations
  has_many :users, through: :users_stations
end
