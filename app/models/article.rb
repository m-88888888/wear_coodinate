class Article < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :gears
  accepts_nested_attributes_for :gears, allow_destroy: true
end
