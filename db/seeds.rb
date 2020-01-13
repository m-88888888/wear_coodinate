# require 'factory_bot'
# include FactoryBot::Syntax::Methods

User.create!(
  name: 'test_login_user',
  email: 'test@test.com',
  password: 'password' ,
  password_confirmation: 'password',
  gender: 1,
  height: 180,
  profile_image: open("#{Rails.root}/db/fixtures/no_image.jpg")
)

10.times do
  User.create(
    name: Faker::Name.unique.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    gender: Faker::Number.between(from: 1, to: 2),
    height: Faker::Number.within(range: 140..200),
    profile_image: open("#{Rails.root}/db/fixtures/no_image.jpg")
  )
end

10.times do |num|
  Article.create(
    user_id: num,
    photo: open("#{Rails.root}/db/fixtures/nofile.jpg"),
    comment: Faker::Lorem.paragraph_by_chars(number: 200),
  )
end

10.times do |num|
  Gear.create(
    article_id: num,
    name: Faker::FunnyName.name,
    kind: 'ヘルメット',
    brand: Faker::FunnyName.name,
    model_year: Faker::Number.within(range: 2000..2100)
  )
end
