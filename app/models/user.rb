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

  validates :name, presence: true
  validates :gender, presence: true
  validates :height, presence: true
  
end
