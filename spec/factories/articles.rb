FactoryBot.define do
  factory :article do
    photo { File.new("#{Rails.root}/spec/fixtures/nofile.jpg") }
    comment { "テストコメント" }
    user
    # gear
  end
end
