class Gear < ApplicationRecord
  mount_uploader :gear_image, GearImageUploader
  belongs_to :article, optional: true

  validates :url, presence: true
  validates :gear_image, presence: true
end