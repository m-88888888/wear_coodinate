# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  profile_image          :string(255)
#  gender                 :integer
#  height                 :integer
#

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
