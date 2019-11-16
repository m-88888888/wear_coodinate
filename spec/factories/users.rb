FactoryBot.define do
  factory :user do
    email { 'test@test.com'}
    password { 'password' }
    password_confirmation { 'password'}
    name { 'test_user' }
    gender { 1 }
    height { 180 }
  end

end
