FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'test@test.com'}
    password { 'password' }
    password_confirmation { 'password'}
    name { 'user' }
    gender { 1 }
    height { 180 }
  end

  factory :test_user, class: User do
    id { 2 }
    email { 'hoge@hoge.com'}
    password { 'password' }
    password_confirmation { 'password'}
    name { 'test_user' }
    gender { 2 }
    height { 200 }
  end


end
