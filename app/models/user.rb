class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def remember_me
    true
  end

  has_many :images
  has_many :users_stations
  has_many :stations, through: :users_stations
  validates :name, presence: true
  validates :email, presence: true
end
