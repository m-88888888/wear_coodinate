FactoryBot.define do
  factory :gear do
    article_id { 1 }
    name { 'アイテム名' }
    kind { 'ヘルメット' }
    brand { 'テストブランド' }
    model_year { 2019 }
    association :article
  end
end
