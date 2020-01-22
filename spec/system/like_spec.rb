require 'rails_helper'

RSpec.describe 'いいね機能', type: :system do
  before do
    user = create(:user)
    create(:article, user: user)
    login_as(user)
  end

  it '投稿をいいね／いいね解除する', js: true do
    visit articles_path

    # いいねボタンがあることを確認
    expect(find('.like-btn')).to have_content '0'

    # 投稿にいいねする
    find('.like-btn').click
    expect(find('.like-btn')).to have_content '1'

    # 投稿のいいねを解除する
    find('.like-btn').click
    expect(find('.like-btn')).to have_content '0'
  end
end
