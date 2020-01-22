require 'rails_helper'

RSpec.describe '人気コーデ表示機能', type: :system do
  it 'いいね数が多い順に表示される' do
    user = create(:user)
    user2 = create(:men_user)
    user3 = create(:women_user)

    article = create(:article, user: user)
    other_article = create(:other_article, user: user2)

    create(:like, user: user, article: article)
    create(:like2, user: user2, article: other_article)
    create(:like3, user: user3, article: article)

    login_as(user)

    visit rank_articles_path
    expect(page.text).to match %r{#{article.likes_count}.*#{other_article.likes_count}}
  end
end
