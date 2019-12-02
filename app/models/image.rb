class Image < ApplicationRecord
  belongs_to :station
  belongs_to :user

  validates :image, presence: true
end
