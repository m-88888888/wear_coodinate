class Gear < ApplicationRecord
  mount_uploader :gear_image, GearImageUploader
  belongs_to :article, optional: true

  validates :name, presence: true, length: { maximum: 30 }
  validates :brand, presence: true
  validates :kind, presence: true
  validates :model_year, presence: true, 
                         format: { with: /\A20\d{2}/, message: 'は「20XX」の形式で入力してください。' }

end