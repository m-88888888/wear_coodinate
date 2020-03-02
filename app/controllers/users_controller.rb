class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if params[:user][:password].blank?
      params[:user].delete('password')
      params[:user].delete('password_confirmation')
    end

    if @user.update(user_params)
      redirect_to root_path, notice: 'ユーザープロフィールを更新しました。'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :gender, :height, :password, :password_confirmation, :email, :created_at, :updated_at)
  end
end
