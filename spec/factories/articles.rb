FactoryBot.define do
  factory :article, class: Article do
    photo { File.new("#{Rails.root}/spec/fixtures/nofile.jpg") }
    comment { "テストコメント" }
    user_id { 1 }

    trait :womens_article do
      comment { 'women users' }
      user_id { 2 }
    end
    
  end

  factory :other_article, class: Article do
    id { 2 }
    photo { File.new("#{Rails.root}/spec/fixtures/nofile.jpg") }
    comment { "テストコメント" }
    user_id { 2 }
  end

  # factory :article3, class: Article do
  #   photo { File.new("#{Rails.root}/spec/fixtures/nofile.jpg") }
  #   comment { "saga of yojo" }
  #   user_id { 3 }
  # end


end
