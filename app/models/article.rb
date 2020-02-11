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
  has_many :gears, inverse_of: :article
  accepts_nested_attributes_for :gears, allow_destroy: true
  default_scope -> { order(created_at: :desc) }

  has_many :likes, dependent: :destroy
  # has_many :liking_users, through: :likes, source: :user

  validates :photo, presence: true
  validates :comment, presence: true, length: { maximum: 200 }
  validate :kind_uniq?, on: :create, on: :update

  scope :change_gender, ->(gender) { joins(:user).where('gender = ?', gender) }
  scope :rank, -> { find(Like.group(:article_id).order('count(article_id) desc').pluck(:article_id)) }
  scope :search, ->(keyword) { includes(:gears).where('gears.name LIKE ?', "%#{keyword}%").references(:gears) }

  def kind_uniq?
    kinds = []
    gears.each do |gear|
      kinds << gear.kind
    end

    if kinds.size != kinds.uniq.size
      errors.add(:gear, 'アイテムの種類は最大1種類ずつのみ登録可能です。')
    end
  end
end
