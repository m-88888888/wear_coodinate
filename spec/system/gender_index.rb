require 'rails_helper'

RSpec.describe 'コーディネート性別毎表示機能', type: :system do
  describe 'コーデの投稿者の性別ごとに一覧を表示する' do
    before do
      @men = create(:men_user)
      @women = create(:women_user)
      create(:article)
      create(:article, :womens_article)
      visit articles_path
    end

    it 'ALLのコーデが表示されること' do
      click_on 'ALL'
      expect(page).to have_content @men.name
      expect(page).to have_content @women.name
    end

    it 'MENのコーデのみが表示されること' do
      click_on 'MEN'
      expect(page).to have_content @men.name
      expect(page).to_not have_content @women.name
    end

    it 'WOMENのコーデのみが表示されること' do
      click_on 'WOMEN'
      expect(page).to_not have_content @men.name
      expect(page).to have_content @women.name
    end
  end
end
