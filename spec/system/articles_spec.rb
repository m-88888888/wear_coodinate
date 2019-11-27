require 'rails_helper'

RSpec.describe '記事管理機能', :type => :system do
  before do
    @user = create(:user)
    login_as(@user)
  end

  describe '記事投稿機能' do
    it '正常に記事が投稿できる' do
      visit new_article_path
      attach_file 'article_photo', "#{Rails.root}/app/assets/images/default.jpg"
      fill_in 'article_comment', with: 'hogehogehoge'
      attach_file 'article_gears_attributes_0_gear_image', "#{Rails.root}/app/assets/images/default.jpg"
      fill_in 'article_gears_attributes_0_name', with: 'hoge'
      fill_in 'article_gears_attributes_0_brand', with: 'hoge'
      select 'ヘルメット', from: 'article_gears_attributes_0_kind'
      fill_in 'article_gears_attributes_0_model_year', with: '2001'
      click_on '登録する'
      expect(page).to have_text("記事を登録しました。")
    end

    it '未入力の場合は投稿できない' do
      visit new_article_path
      click_on '登録する'
      expect(page).to have_text('アイテム名を入力してください')
      expect(page).to have_text('ブランドを入力してください')
      expect(page).to have_text('種類を入力してください')
      expect(page).to have_text('モデル年式を入力してください')
      expect(page).to have_text('モデル年式は「20XX」の形式で入力してください')
      expect(page).to have_text('コーディネート画像を入力してください')
      expect(page).to have_text('コーディネート紹介文を入力してください')
    end

    it 'アイテム詳細の入力フォームが動的に増やすことができる', js: true do
      visit new_article_path
      click_on 'add-form'
      expect(page).to have_css('#article_gears_attributes_1_name')
    end

    it 'アイテム詳細の入力フォームをへらすことができる', js: true do
      visit new_article_path
      # click_on 'add-form'
      click_on '削除'
      expect(page).not_to have_css('#article_gears_attributes_0_name')
    end

  end

end