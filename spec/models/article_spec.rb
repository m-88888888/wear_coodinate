require 'rails_helper'

RSpec.describe Article, type: :model do

  before do
    @user = create(:user)
  end

  describe "#create" do
    it 'コーディネート画像、コーディネート紹介文があれば有効な状態であること' do
      article = create(:article)
      article.valid?
      expect(article).to be_valid
    end

    it 'コーディネート画像がなければ無効な状態であること' do
      article = build(:article, photo: nil)
      article.valid?
      expect(article.errors[:photo]).to include("を入力してください")
    end

    it 'コーディネート紹介文がなければ無効な状態であること' do
      article = build(:article, comment: nil)
      article.valid?
      expect(article.errors[:comment]).to include("を入力してください")
    end

    it 'コーディネート紹介文が200文字以上あれば無効な状態であること' do
      comment = 'a' * 201
      article = build(:article, comment: comment)
      article.valid?
      expect(article.errors[:comment]).to include("は200文字以内で入力してください")
    end

    it 'コーディネート紹介文が200文字以内であれば有効な状態であること' do
      comment = 'a' * 200
      article = build(:article, comment: comment)
      article.valid?
      expect(article).to be_valid
    end
  end
end
