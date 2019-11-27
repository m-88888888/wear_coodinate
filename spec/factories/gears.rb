FactoryBot.define do
  factory :gear do
    name { 'アイテム名' }
    kind { 'ヘルメット' }
    brand { 'テストブランド' }
    model_year { 2019 }
    article
  end
end
