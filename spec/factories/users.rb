# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  profile_image          :string(255)
#  gender                 :integer
#  height                 :integer
#

FactoryBot.define do
  factory :user do
    email { 'test@test.com' }
    password { 'password' }
    password_confirmation { 'password' }
    name { Faker::Name.unique.name }
    gender { 1 }
    height { 170 }
  end

  factory :men_user, class: User do
    email { 'test@test.com1' }
    password { 'password' }
    password_confirmation { 'password' }
    name { Faker::Name.unique.name }
    gender { 1 }
    height { 180 }
  end

  factory :women_user, class: User do
    email { Faker::Internet.free_email }
    password { 'password' }
    password_confirmation { 'password' }
    name { Faker::Name.unique.name }
    gender { 2 }
    height { 200 }
  end
end
