class LikesController < ApplicationController
  before_action :set_id_name

  def create
    @like = current_user.likes.create!(article_id: @article.id)
  end

  def destroy
    @like = current_user.likes.find_by(article_id: params[:id])
    @like.destroy!
  end

  private

  def set_id_name
    @article = Article.find(params[:id])
    @id_name = "#like-btn-#{@article.id}"
  end
end
