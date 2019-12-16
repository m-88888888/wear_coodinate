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

require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#create" do

    it "正常に登録できる" do
      user = create(:user)
      expect(user).to be_valid 
    end

    # メールアドレスのvalidation
    it "メールアドレス未入力の場合登録不可" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "メールアドレスが重複する場合登録不可" do
      user = create(:user)
      user = build(:user, email: user.email)
      user.valid?
      expect(user.errors[:email]).to include("は既に使用されています。")
    end

    # TODO メールアドレスのフォーマットを確認するテストを追加すること
    it 'メールアドレスのフォーマットが正しくなければ登録不可であること' do
      user = build(:user, email: 'testmailatejkl')
      user.valid?
      expect(user.errors[:email]).to include("は有効でありません。")
    end

    # パスワードのvalidation
    it "パスワード未入力の場合登録不可" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it "パスワード6文字以下の場合登録不可" do
      user = build(:user, password: 'aaaaa')
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
    end

    # 名前のvalidation
    it "名前未入力の場合登録不可" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "名前が16文字以上の場合登録不可" do
      user = build(:user, name: 'hogehogehogehoge')
      user.valid?
      expect(user.errors[:name]).to include("は15文字以内で入力してください")
    end

    # 性別のvalidation
    it "性別が未選択の場合登録不可" do
      user = build(:user, gender: nil)
      user.valid?
      expect(user.errors[:gender][0]).to include("を入力してください")
      expect(user.errors[:gender][1]).to include("は数値で入力してください")
    end

    it "性別に0が入力されたら登録不可" do
      user = build(:user, gender: 0)
      user.valid?
      expect(user.errors[:gender]).to include("は0より大きい値にしてください")
    end

    it "性別に3以上が入力されたら登録不可" do
      user = build(:user, gender: 3)
      user.valid?
      expect(user.errors[:gender]).to include("は3より小さい値にしてください")
    end

    # 身長のvalidation
    it "身長が未入力の場合登録不可" do
      user = build(:user, height: nil)
      user.valid?
      expect(user.errors[:height][0]).to include("を入力してください")
      expect(user.errors[:height][1]).to include("は数値で入力してください")
    end

    it "身長に139以下が入力されたら登録不可" do
      user = build(:user, height: 139)
      user.valid?
      expect(user.errors[:height]).to include("は139より大きい値にしてください")  
    end

    it "身長に221以上が入力されたら登録不可" do
      user = build(:user, height: 221)
      user.valid?
      expect(user.errors[:height]).to include("は221より小さい値にしてください")  
    end

  end
  
end
