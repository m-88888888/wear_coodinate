require 'rails_helper'

RSpec.describe 'いいね機能', :type => :system do
  it '投稿をいいね／いいね解除する', js: true do
    user = create(:user)
    article = create(:article)

    # ログインする
    visit new_user_session_path
    click_on('test_login')
    expect(page).to have_text("ログインしました。")

    # いいねボタンがあることを確認
    expect(find('.iine_button')).to have_content '♡0'

    # 投稿にいいねする
    click_on '♡0'
    expect(find('.iine_button')).to have_content '❤1'

    # 投稿のいいねを解除する
    click_on '❤1'
    expect(find('.iine_button')).to have_content '♡0'
  end
end