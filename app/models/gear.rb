# == Schema Information
#
# Table name: gears
#
#  id         :bigint           not null, primary key
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  gear_image :string(255)
#  name       :string(255)
#  kind       :string(255)
#  brand      :string(255)
#  model_year :integer
#

class Gear < ApplicationRecord
  mount_uploader :gear_image, GearImageUploader
  belongs_to :article, optional: true

  validates :name, presence: true, length: { maximum: 30 }
  validates :brand, presence: true
  validates :kind, presence: true
  validates :model_year, presence: true,
                         format: { with: /\A20\d{2}/, message: 'は「20XX」の形式で入力してください。' }

  scope :narrow_down_name, ->(name) { where('name LIKE ?', "%#{name}%") if name.present? }
  scope :narrow_down_brand, ->(brand) { where('brand = ?', brand) if brand.present? }
  scope :narrow_down_kind, ->(kind) { where('kind = ?', kind) if kind.present? }

  scope :search, ->(search_params) do
    return if search_params.blank?

    narrow_down_name(search_params[:name])
      .narrow_down_brand(search_params[:brand])
      .narrow_down_kind(search_params[:kind])
  end
end
