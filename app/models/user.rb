class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  # has_many :liking_articles, through: :likes, source: :article

  has_one_attached :image
  mount_uploader :profile_image, ProfileImageUploader

  validates :name, presence: true, length: { maximum: 15 }
  validates :gender, presence: true, numericality: {
      only_integer: true,
      greater_than: 0,
      less_than: 3
  }
  validates :height, presence: true, numericality: {
      only_integer: true,
      greater_than: 139,
      less_than: 221
  }
  
end
