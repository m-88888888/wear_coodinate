FactoryBot.define do
  factory :article, class: Article do
    photo { File.new("#{Rails.root}/spec/fixtures/nofile.jpg") }
    comment { "テストコメント" }
    user_id { 1 }

    # trait :other_users_article do
    #   photo { File.new("#{Rails.root}/spec/fixtures/nofile.jpg") }
    #   comment { 'other users' }
    #   user_id { 2}
    # end
    
  end

  factory :other_article, class: Article do
    photo { File.new("#{Rails.root}/spec/fixtures/nofile.jpg") }
    comment { "テストコメント" }
    user_id { 2 }


  end


end
