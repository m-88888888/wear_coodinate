class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :update]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @gears = @article.gears.all
  end

  def new
    @article = Article.new
    @article.gears.build
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to articles_path, notice: "記事を登録しました。"
    else
      # redirect_to new_article_path
      render :new
    end

  end

  def edit
    @article = Article.find(params[:id])
    @article.gears.build
  end

  def update
    @article = Article.find(params[:id])
    @article.user_id = current_user.id

    if @article.photo.nil?
      @article.photo = default_url
    end

    if @article.update(article_params)
      redirect_to articles_path, notice: "記事を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path, notice: "記事を削除しました。"
  end

  private

    def article_params
      params.require(:article).permit(:photo, :comment, gears_attributes:[:id, :url, :gear_image])
    end

end
