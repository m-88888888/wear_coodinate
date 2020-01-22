class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank?
      params[:user].delete('password')
      params[:user].delete('password_confirmation')
      if @user.update(user_params)
        redirect_to root_path, notice: 'ユーザープロフィールを更新しました。'
      else
        render :edit
      end
    end
  end

  def update_password
    @user = current_user
    if @user.update(user_password_params)
      bypass_sign_in(@user)
      redirect_to root_path, notice: 'パスワードを更新しました。'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :gender, :height, :password, :password_confirmation, :email, :created_at, :updated_at)
  end

  def user_password_params
    params.require(:user).permit(:password, :password_confirmation, :email)
  end
end
