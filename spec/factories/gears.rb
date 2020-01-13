# == Schema Information
#
# Table name: gears
#
#  id         :bigint           not null, primary key
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  gear_image :string(255)
#  name       :string(255)
#  kind       :string(255)
#  brand      :string(255)
#  model_year :integer
#

FactoryBot.define do
  factory :gear do
    gear_image { File.new("#{Rails.root}/spec/fixtures/nofile.jpg") }
    name { 'test_NAME' }
    kind { 'ヘルメット' }
    brand { 'テストブランド' }
    model_year { 2019 }
    association :article
  end

  factory :two_gear, class: Gear do
    name { 'test_NAME' }
    kind { 'ヘルメット' }
    brand { 'テストブランド' }
    model_year { 2019 }
    association :article
  end

  factory :gear3, class: Gear do
    name { 'hogehoge' }
    kind { 'ヘルメット' }
    brand { 'OGASAKA' }
    model_year { 2019 }
    association :article

  end
end
