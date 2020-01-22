class LikesController < ApplicationController
  before_action :set_valiables

  def like
    @like = current_user.likes.new(article_id: params[:article_id])
    @like.save
  end

  def unlike
    @like = current_user.likes.find_by(article_id: params[:article_id])
    @like.destroy
  end

  private

  def set_valiables
    @article = Article.find(params[:article_id])
    @id_name = "#like-link-#{@article.id}"
  end
end
