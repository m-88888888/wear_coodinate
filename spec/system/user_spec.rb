require 'rails_helper'

RSpec.describe 'ユーザー管理機能', :type => :system do
  before do
    @user = create(:user)
    logout(@user)
  end

  describe 'ログイン機能' do
    it 'かんたんログインでログインできる' do
      visit new_user_session_path
      click_on('test_login')
      expect(page).to have_text("ログインしました。")
    end

    it '通常のログイン機能を使用してログインできる' do
      visit new_user_session_path
      fill_in "inputEmail",	with: "test@test.com"
      fill_in "inputPassword", with: "password"
      click_on 'login'
      expect(page).to have_text("ログインしました。")  
    end
  end

  describe 'ログアウト機能' do
    it 'ログイン後ログアウトできる' do
      visit new_user_session_path
      click_on 'test_login'
      click_on 'ログアウト'
      expect(page).to have_text("ログアウトしました。")
    end
  end

  describe 'ユーザープロフィール機能' do
    it 'パスワードを入力せずにプロフィールが編集できる' do
      login_as(@user)
      visit edit_user_path(@user.id)
      attach_file 'profile_image', "#{Rails.root}/app/assets/images/default.jpg"
      fill_in 'user_name', with: 'テストネーム'
      choose 'WOMEN'
      select '200', from: 'user_height'
      fill_in 'user_email', with: 'hoge@hoge.com'
      click_on '更新'
      expect(page).to have_text("ユーザープロフィールを更新しました。")
    end

    it 'パスワードを変更できる' do
      login_as(@user)
      visit edit_user_path(@user.id)
      fill_in 'user_password', with: 'hogehoge'
      fill_in 'user_password_confirmation', with: 'hogehoge'
      click_on '更新'
      expect(page).to have_text("ユーザープロフィールを更新しました。")
    end
  end

  describe 'ユーザー詳細表示機能' do
    it 'ログイン中のユーザープロフィールと投稿した記事一覧が表示される' do
      login_as(@user)
      visit user_path(@user.id)
      expect(page).to have_text(@user.name)
      expect(page).to have_text("MEN")
      expect(page).to have_text("170cm")
      # 記事が表示されることを確認するテストを追記すること
    end

    it '投稿したコーディネート一覧が表示される' do
      pending "未実装" do
        
      end
      
    end
  end

end