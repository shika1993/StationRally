class Image < ApplicationRecord
  belongs_to :station
  belongs_to :user

  validates :image, presence: true
  mount_uploader :image, ImageUploader
end
