require 'rails_helper'

RSpec.describe '記事管理機能', :type => :system do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  describe '記事投稿機能' do
    before do
      visit new_article_path
    end

    it '正常に記事が投稿できること' do
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
    
    it 'アイテム詳細の入力フォームが動的に増やすことができること', js: true do
      click_on 'add-form'
      expect(page).to have_css('#article_gears_attributes_1_name')
    end

    it 'アイテム詳細の入力フォームをへらすことができること', js: true do
      click_on '削除'
      expect(page).not_to have_css('#article_gears_attributes_0_name')
    end
  
    it '未入力の場合は投稿できないこと' do
      click_on '登録する'
      expect(page).to have_text('アイテム名を入力してください')
      expect(page).to have_text('ブランドを入力してください')
      expect(page).to have_text('種類を入力してください')
      expect(page).to have_text('モデル年式を入力してください')
      expect(page).to have_text('モデル年式は「20XX」の形式で入力してください')
      expect(page).to have_text('コーディネート画像を入力してください')
      expect(page).to have_text('コーディネート紹介文を入力してください')
    end
  end

  describe '記事編集・削除機能' do
    let!(:article) { create(:article, user: user) }
    before do
      visit articles_path
    end

    it '投稿した記事を編集できること', js: true do
      click_on 'thmb'
      click_on '編集'
      attach_file 'article_gears_attributes_0_gear_image', "#{Rails.root}/app/assets/images/default.jpg"
      fill_in 'article_gears_attributes_0_name', with: 'hoge'
      fill_in 'article_gears_attributes_0_brand', with: 'hoge'
      select 'ヘルメット', from: 'article_gears_attributes_0_kind'
      fill_in 'article_gears_attributes_0_model_year', with: '2001'
      click_on '更新する'
      expect(page).to have_text('記事を更新しました。')
    end
    
    it '投稿した記事を削除できること', js: true do
      click_on 'thmb'
      click_on '削除'
      page.accept_confirm
      expect(page).to have_text('記事を削除しました。')
    end
  
    it '他ユーザーの記事は編集・削除できない' do
      create(:men_user)
      create(:other_article, user: user)
      click_on 'thmb'
      expect(page).not_to eq('編集')
      expect(page).not_to eq('削除')
    end
  end
    
end