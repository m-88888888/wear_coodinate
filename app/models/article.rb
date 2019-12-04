class Article < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :gears
  accepts_nested_attributes_for :gears, allow_destroy: true
  default_scope -> { order(created_at: :desc) }

  has_many :likes, dependent: :destroy
  # has_many :liking_users, through: :likes, source: :user

  validates :photo, presence: true
  validates :comment, presence: true, length: { maximum: 200}
end
