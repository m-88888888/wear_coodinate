require 'rails_helper'

RSpec.describe 'アイテムリスト', :type => :system do
  
  describe 'アイテム一覧' do
    let!(:user) { create(:user) }
    let!(:article) { create(:article, user: user) }
    let!(:gear) { create(:gear, article: article) }
    before do
      login_as(user)
      visit gears_path
    end

    it '投稿済みのアイテムが表示されること' do
      expect(page).to have_content "アイテム名：#{gear.name}"
      expect(page).to have_content "ブランド：#{gear.brand}"
      expect(page).to have_content "種類：#{gear.kind}"
      expect(page).to have_content "モデル年式：#{gear.model_year}"
    end

    context "検索が正常にできるかどうか" do
      it '検索ボタンでコーデを検索できること' do
        click_on 'このアイテムを使ったコーデを検索'
        expect(page).to have_content gear.article.user.name
      end

      it '検索フォームで検索できること' do
        fill_in "search",	with: "アイテム名"
        click_on 'このアイテムを使ったコーデを検索'
        expect(page).to have_content user.name 
      end

      it '一部検索で検索できること' do
        fill_in "search",	with: "アイテム"
        click_on 'このアイテムを使ったコーデを検索'
        expect(page).to have_content user.name 
      end
      
      it '小文字で検索できること'do
      fill_in "search",	with: "TEST"
      click_on 'このアイテムを使ったコーデを検索'
      expect(page).to have_content user.name 
      end
    end
    
  end
end