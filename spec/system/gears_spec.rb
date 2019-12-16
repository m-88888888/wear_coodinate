require 'rails_helper'

RSpec.describe 'アイテムリスト', :type => :system do
  before do
    @user = create(:user)
    @article = create(:article, user: @user)
    @gear = create(:gear, article: @article)
    login_as(@user)
    visit gears_path
  end

  describe 'アイテム一覧' do
    it '投稿済みのアイテムが表示されること' do
      expect(page).to have_content "アイテム名：#{@gear.name}"
      expect(page).to have_content "ブランド：#{@gear.brand}"
      expect(page).to have_content "種類：#{@gear.kind}"
      expect(page).to have_content "モデル年式：#{@gear.model_year}"
    end

    it '検索ボタンでコーデを検索できること' do
      click_on 'このアイテムを使ったコーデを検索'
      expect(page).to have_content @gear.article.user.name
    end

    context "検索が正常にできるかどうか" do
      it '検索フォームで検索できること' do
        fill_in "search",	with: "アイテム名"
        click_on 'このアイテムを使ったコーデを検索'
        expect(page).to have_content @user.name 
      end

      it '一部検索で検索できること' do
        fill_in "search",	with: "アイテム"
        click_on 'このアイテムを使ったコーデを検索'
        expect(page).to have_content @user.name 
      end
    end

    context "異常系" do
      it '小文字でヒットしない？'do
        fill_in "search",	with: "TEST"
        click_on 'このアイテムを使ったコーデを検索'
        expect(page).to have_content @user.name 
      end
    end
    
    

  end
end