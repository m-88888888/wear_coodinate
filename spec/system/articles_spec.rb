require 'rails_helper'

RSpec.describe '記事管理機能', type: :system do
  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  describe '記事投稿機能' do
    before do
      visit new_article_path
    end

    it '正常に記事が投稿できること', js: true do
      attach_file 'image-file', "#{Rails.root}/app/assets/images/default.jpg"
      fill_in 'article_comment', with: 'hogehogehoge'
      attach_file 'article_gears_attributes_0_gear_image', "#{Rails.root}/app/assets/images/default.jpg"
      fill_in 'article_gears_attributes_0_name', with: 'hoge'
      fill_in 'article_gears_attributes_0_brand', with: 'hoge'
      select 'ヘルメット', from: 'article_gears_attributes_0_kind'
      fill_in 'article_gears_attributes_0_model_year', with: '2001'
      click_on '登録する'
      expect(page).to have_text('記事を登録しました。')
    end

    it 'アイテムの入力フォームが動的に増減可能であること', js: true do
      click_on 'add-form'
      fields = all(:css, '.fields')
      expect(fields[1]).to have_content 'アイテム画像'
      within page.all('remove_nested_fields')[1] do
        click_link '削除'
      end
      # click_on delete_btn[1]
      expect(fields[1]).not_to have_content 'アイテム画像'
    end

    it '未入力の場合は投稿できないこと', js: true do
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
      find('.edit-btn').click
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
      find('.delete-btn').click
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
