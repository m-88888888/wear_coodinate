require 'rails_helper'

RSpec.describe 'いいね機能', :type => :system do
  before do
    user = create(:user)
    article = create(:article)
    login_as(user)
  end

  it '投稿をいいね／いいね解除する', js: true do
    visit articles_path

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