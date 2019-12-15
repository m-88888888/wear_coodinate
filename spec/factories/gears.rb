FactoryBot.define do
  factory :gear do
    article_id { 1 }
    gear_image { File.new("#{Rails.root}/spec/fixtures/nofile.jpg") }
    name { 'test_NAME' }
    kind { 'ヘルメット' }
    brand { 'テストブランド' }
    model_year { 2019 }
    association :article
  end

  factory :two_gear, class: Gear do
    article_id { 2 }
    name { 'test_NAME' }
    kind { 'ヘルメット' }
    brand { 'テストブランド' }
    model_year { 2019 }
    association :article
  end

end
