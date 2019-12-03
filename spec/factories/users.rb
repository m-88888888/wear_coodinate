FactoryBot.define do

  factory :user do
    id { 1 }
    email { 'test@test.com'}
    password { 'password' }
    password_confirmation { 'password'}
    name { Faker::Name.unique.name }
    gender { 1 }
    height { 170 }
  end

  factory :men_user, class: User do
    id { 2 }
    email { 'test@test.com1'}
    password { 'password' }
    password_confirmation { 'password'}
    name { Faker::Name.unique.name }
    gender { 1 }
    height { 180 }
  end

  factory :women_user, class: User do
    id { 3 }
    email { Faker::Internet.free_email }
    password { 'password' }
    password_confirmation { 'password'}
    name { Faker::Name.unique.name }
    gender { 2 }
    height { 200 }
  end

end
