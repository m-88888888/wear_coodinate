# == Schema Information
#
# Table name: articles
#
#  id          :bigint           not null, primary key
#  photo       :string(255)
#  comment     :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#  likes_count :integer
#

FactoryBot.define do
  factory :article, class: Article do
    photo { File.new("#{Rails.root}/spec/fixtures/nofile.jpg") }
    comment { 'テストコメント' }
    association :user

    trait :womens_article do
      comment { 'women users' }
      association :user
    end
  end

  factory :other_article, class: Article do
    photo { File.new("#{Rails.root}/spec/fixtures/nofile.jpg") }
    comment { 'テストコメント' }
    association :user
  end

  # factory :article do
  #   id { 1 }
  #   photo { File.new("#{Rails.root}/spec/fixtures/nofile.jpg") }
  #   comment { 'hogehoge' }
  #   created_at Time.now
  #   updated_at Time.now
  #   user_id { 1 }
  #   like_count { 1 }

  #   factory :article_with_gears do
  #     transient do
  #       gears_count { 2 }
  #     end

  #     after(:build) do |article, evaluator|
  #       build_list(:gear3, evaluator.gears_count, article: article)
  #     end
  #   end
  # end
end
