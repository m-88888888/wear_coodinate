require 'gear.rb'

class GearsController < ApplicationController

  def index
    #TODO 重複するアイテムを覗いた一碗を取得する
    @gears = Gear.all
  end

  def search
    keyword = params[:search]
    @articles = Article.search(keyword)
    # raise
    render 'articles/index'
  end
end
