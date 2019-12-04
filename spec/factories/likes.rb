FactoryBot.define do
  factory :like do
    user_id { 1 }
    article_id { 1 }
    article

    trait :like2 do
      article_id { 2 }
      # other_article
    end
  end

  factory :like3, class: Like do
    user_id { 2 }
    article_id { 1 }
    article
  end


end