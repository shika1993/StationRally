class Image < ApplicationRecord
  belongs_to :station
  belongs_to :user
  validates :picture, presence: true

  mount_uploader :picture, ImageUploader
end
