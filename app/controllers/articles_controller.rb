class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :update]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @articles = if params[:gender].present?
                  Article.change_gender(params[:gender])
                else
                  Article.all
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
    # if kind_uniq?(@article.gears)
      if @article.save
        redirect_to articles_path, notice: '記事を登録しました。'
      else
        render :new
      end
    # else
    #   flash.now[:danger] = 'アイテムの種類は最大1種類ずつのみ登録可能です。'
    #   render :new
    # end
  end

  def edit
    @article = Article.find(params[:id])
    @article.gears.build
  end

  def update
    @article = Article.find(params[:id])
    @article.user_id = current_user.id

    @article.photo = default_url if @article.photo.nil?

    if @article.update(article_params)
      redirect_to articles_path, notice: '記事を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path, notice: '記事を削除しました。'
  end

  def rank
    @articles = Article.rank
  end

  private

  def article_params
    params.require(:article).permit(
      :photo,
      :comment,
      gears_attributes: [
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

  # def kind_uniq?(gears)
  #   kinds = []
  #   uniq_check = {}

  #   # 配列gearsからkindを抽出して配列生成
  #   gears.each do |gear|
  #     kinds << gear.kind
  #   end

  #   kinds.each do |kind|
  #     return false if uniq_check.key?(kind)
  #     uniq_check[kind] = true
  #   end

  #   return true
  # end
end
