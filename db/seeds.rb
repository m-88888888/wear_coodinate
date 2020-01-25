# require 'factory_bot'
# include FactoryBot::Syntax::Methods

# 簡単ログイン用のユーザー
User.create!(
  name: 'テストユーザー',
  email: 'test@test.com',
  password: 'password',
  password_confirmation: 'password',
  gender: 1,
  height: 180,
  profile_image: open("#{Rails.root}/db/fixtures/avatar0.png")
)

4.times do |n|
  User.create(
    name: Faker::Internet.username(specifier: 5..8),
    email: "sample#{n}@example.com",
    password: 'password',
    password_confirmation: 'password',
    gender: Faker::Number.between(from: 1, to: 2),
    height: Faker::Number.within(range: 140..200),
    profile_image: open("#{Rails.root}/db/fixtures/avatar#{n}.png")
  )
end

users = User.all

0.upto(4) do |n|
  users[n].articles.create(
    photo: open("#{Rails.root}/db/fixtures/coordinate#{n}.jpg"),
    comment: Faker::Lorem.paragraph_by_chars(number: 200)
  )
end

articles = Article.all
gear_image_list = ['dragon.jpg', 'grove.jpg', 'jacket1.jpg', 'paker1.jpg', 'pantu1.jpg', 'poc-fornix.jpg']
kind_list = %w[ヘルメット ゴーグル グローブ ジャケット パンツ パーカー フリース]

5.times do |n|
  gear_image = gear_image_list.shuffle.sample
  kind = kind_list.shuffle.sample
  articles[n].gears.create(
    gear_image: open("#{Rails.root}/db/fixtures/#{gear_image}"),
    name: Faker::FunnyName.name,
    kind: kind,
    brand: Faker::FunnyName.name,
    model_year: Faker::Number.within(range: 2000..2100)
  )
end

random = Random.new

5.times do |n|
  users[n].likes.create(
    article_id: random.rand(1..4)
  )
end
