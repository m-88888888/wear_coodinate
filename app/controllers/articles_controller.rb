class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :update]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    if params[:gender].present?
      @articles = Article.change_gender(params[:gender])
    else
      @articles = Article.all
    end
  end

  def show
    @article = Article.find(params[:id])
    @gears = @article.gears
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

  def rank
    @articles = Article.rank
  end


  private

    def article_params
      params.require(:article).permit(
                                      :photo,
                                      :comment,
                                      gears_attributes:[
                                                          :id,
                                                          :gear_image,
                                                          :name,
                                                          :brand,
                                                          :kind,
                                                          :model_year,
                                                          :_destroy
                                                        ]
                                      )
        end

    def correct_user
      @article = current_user.articles.find_by(id: params[:id])
      redirect_to(root_path) unless @article
    end

end
