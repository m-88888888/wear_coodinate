require 'rails_helper'

RSpec.describe 'アイテムリスト', type: :system do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user) }
  let!(:gear) { create(:gear, article: article) }
  let!(:gear3) { create(:gear3, article: article) }

  before do
    login_as(user)
    visit gears_path
  end

  describe 'アイテム一覧表示' do
    it '投稿済みのアイテムが表示されること', js: true do
      expect(page).to have_content gear.name.to_s
      expect(page).to have_content gear.brand.to_s
      expect(page).to have_content gear.kind.to_s
      expect(page).to have_content gear.model_year.to_s
    end

    it '検索ボタンでコーデを検索できること', js: true do
      click_on 'このアイテムを使ったコーデを検索', match: :first
      expect(page).to have_selector("img[src$='nofile.jpg']")
    end
  end

  describe 'アイテム検索' do
    context 'キーワード検索' do
      it 'キーワード検索で検索できること', js: true do
        fill_in 'gear_name', with: 'test_NAME'
        click_on '検索'
        expect(page).to have_selector("img[src$='nofile.jpg']")
      end

      it '部分検索で検索できること', js: true do
        fill_in 'gear_name', with: 'test_NAME'
        click_on '検索'
        expect(page).to have_selector("img[src$='nofile.jpg']")
      end
    end

    context 'ブランド検索' do
      it '無選択の状態で検索できること', js: true do
        click_on '検索'
        expect(page).to have_selector("img[src$='nofile.jpg']")
      end

      it 'ブランドを選択して検索できること', js: true do
        select 'テストブランド'
        click_on '検索'
        expect(page).to have_selector("img[src$='nofile.jpg']")
      end
    end

    context '種類検索' do
      it '無選択の状態で検索できること', js: true do
        click_on '検索'
        expect(page).to have_selector("img[src$='nofile.jpg']")
      end

      it '種類を選択して検索できること', js: true do
        select 'ヘルメット'
        click_on '検索'
        expect(page).to have_selector("img[src$='nofile.jpg']")
      end
    end

    describe 'パターン検索' do
      context 'ヒットする' do
        it 'キーワードとブランドと種類', js: true do
          fill_in 'gear_name', with: 'test_NAME'
          select 'テストブランド'
          select 'ヘルメット'
          click_on '検索'
          expect(page).to have_selector("img[src$='nofile.jpg']")
        end

        it 'キーワードとブランド', js: true do
          fill_in 'gear_name', with: 'test_NAME'
          select 'テストブランド'
          click_on '検索'
          expect(page).to have_selector("img[src$='nofile.jpg']")
        end

        it 'キーワードと種類', js: true do
          fill_in 'gear_name', with: 'test_NAME'
          select 'ヘルメット'
          click_on '検索'
          expect(page).to have_selector("img[src$='nofile.jpg']")
        end

        it 'ブランドと種類', js: true do
          select 'テストブランド'
          select 'ヘルメット'
          click_on '検索'
          expect(page).to have_selector("img[src$='nofile.jpg']")
        end
      end

      context 'ヒットしない' do
        it 'キーワード、ブランド、種類すべて合っていない', js: true do
          fill_in 'gear_name', with: 'hogehoge'
          select 'OGASAKA'
          select 'グローブ'
          click_on '検索'
          expect(page).not_to have_selector("img[src$='nofile.jpg']")
        end

        it 'キーワードは合っているが種類が合っていない', js: true do
          fill_in 'gear_name', with: 'test_NAME'
          select 'ゴーグル'
          click_on '検索'
          expect(page).not_to have_selector("img[src$='nofile.jpg']")
        end

        it 'ブランド、種類は合っているがキーワードが合っていない', js: true do
          fill_in 'gear_name', with: 'hogehoge'
          select 'テストブランド'
          select 'ヘルメット'
          click_on '検索'
          expect(page).not_to have_selector("img[src$='nofile.jpg']")
        end
      end
    end
  end
end
