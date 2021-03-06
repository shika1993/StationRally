class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :images, dependent: :destroy
  has_many :users_stations, dependent: :destroy
  has_many :stations, through: :users_stations, dependent: :destroy
  has_many :favorites
  validates :name, presence: true
  validates :email, presence: true
end
