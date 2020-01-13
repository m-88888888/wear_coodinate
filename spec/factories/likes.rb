# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  user_id    :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :like do
    association :user
    association :article
  end

  factory :like2, class: Like do
    association :user
    association :article
  end

  factory :like3, class: Like do
    association :user
    association :article
  end
end
