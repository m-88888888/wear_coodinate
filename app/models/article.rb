# == Schema Information
#
# Table name: articles
#
#  id          :bigint           not null, primary key
#  photo       :string(255)
#  comment     :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#  likes_count :integer
#

class Article < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :gears, foreign_key: :article_id, primary_key: :id, inverse_of: :article
  accepts_nested_attributes_for :gears, allow_destroy: true
  default_scope -> { order(created_at: :desc) }

  has_many :likes, dependent: :destroy
  # has_many :liking_users, through: :likes, source: :user

  validates :photo, presence: true
  validates :comment, presence: true, length: { maximum: 200}

  scope :change_gender, -> (gender) { joins(:user).where("gender = ?", gender)}
  scope :rank, -> { find(Like.group(:article_id).order("count(article_id) desc").pluck(:article_id)) }
end
