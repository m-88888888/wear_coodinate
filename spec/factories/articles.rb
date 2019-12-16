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
    comment { "テストコメント" }
    # user_id { 1 }
    association :user

    trait :womens_article do
      comment { 'women users' }
      # user_id { 2 }
      association :user
    end
    
  end

  factory :other_article, class: Article do
    # id { 2 }
    photo { File.new("#{Rails.root}/spec/fixtures/nofile.jpg") }
    comment { "テストコメント" }
    # user_id { 2 }
    association :user
  end
end
