class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def index
    @users = User.all
  end
end
