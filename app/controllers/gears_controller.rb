require 'gear.rb'

class GearsController < ApplicationController
  before_action :narrow_down_list, only: [:index, :search_gear]

  def index
    @gears = Gear.all
  end

  def search_gear
    @gears = Gear.search(gear_search_params)
    render action: :index
  end

  def search_article
    keyword = params[:search]
    @articles = Article.search(keyword)
    render 'articles/index'
  end

  def rakuten_search
    gear = Gear.find(params[:gear_id])
    keyword = gear.get_search_keyword
    @items = RakutenWebService::Ichiba::Item.search(keyword: keyword)
  end

  private

  def gear_search_params
    params.require(:gear).permit(:name, :brand, :kind, :search)
  end

  def narrow_down_list
    @brands = []
    @kinds = []

    Gear.all.each do |gear|
      @brands << gear.brand
      @kinds << gear.kind
    end
  end
end
