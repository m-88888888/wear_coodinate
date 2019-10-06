class ArticlesController < ApplicationController

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
    @article.save
    redirect_to articles_path, notice: "記事を登録しました。"
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update!(article_params)
    redirect_to articles_path, notice: "記事を更新しました。"
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
