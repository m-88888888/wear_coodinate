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

require 'rails_helper'

RSpec.describe Gear, type: :model do
  let(:article) { create(:article) }

  describe 'validationのテスト' do
    it '名前、ブランド、種類、モデル年式があれば有効な状態であること' do
      gear = create(:gear, article: article)
      gear.valid?
      expect(gear).to be_valid
    end

    it '名前がなければ無効な状態であること' do
      gear = build(:gear, name: nil)
      gear.valid?
      expect(gear.errors[:name]).to include('を入力してください')
    end

    it '名前が30文字以上であれば無効な状態であること' do
      gear = build(:gear, name: 'a' * 31)
      gear.valid?
      expect(gear.errors[:name]).to include('は30文字以内で入力してください')
    end

    it 'ブランドがなければ無効な状態であること' do
      gear = build(:gear, brand: nil)
      gear.valid?
      expect(gear.errors[:brand]).to include('を入力してください')
    end

    it '種類がなければ無効な状態であること' do
      gear = build(:gear, kind: nil)
      gear.valid?
      expect(gear.errors[:kind]).to include('を入力してください')
    end

    it 'モデル年式がなければ無効な状態であること' do
      gear = build(:gear, model_year: nil)
      gear.valid?
      expect(gear.errors[:model_year]).to include('を入力してください')
    end

    it 'モデル年式は「20XX」の形式でなければ無効な状態であること' do
      gear = build(:gear, model_year: 1999)
      gear.valid?
      expect(gear.errors[:model_year]).to include('は「20XX」の形式で入力してください。')
    end
  end
end
