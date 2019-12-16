require 'rails_helper'

RSpec.describe '人気コーデ表示機能', :type => :system do
  before do
    user = create(:user)
    user2 = create(:men_user)
    user3 = create(:women_user)

    @article = create(:article, user: user)
    @other_article = create(:other_article, user: user2)

    create(:like, user_id: user.id, article_id: @article.id)
    create(:like, :like2, user_id: user2.id, article_id: @other_article.id)
    create(:like, user_id: user3.id, article_id: @article.id)

    login_as(user)
  end

  it 'いいね数が多い順に表示される' do
    visit rank_articles_path
    expect(page.text).to match %r{#{@article.likes_count}.*#{@other_article.likes_count}}
  end
end