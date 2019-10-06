class Gear < ApplicationRecord
  mount_uploader :gear_image, GearImageUploader
  belongs_to :article, optional: true
end