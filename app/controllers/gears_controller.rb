require 'gear.rb'

class GearsController < ApplicationController
  before_action :narrow_down_list, only: [:index, :search_gear]

  def index
    @gears = Gear.all
  end

  def search_gear
    @search_params = gear_search_params
    @gears = Gear.search(@search_params)
    render action: :index
  end

  def search
    keyword = params[:search]
    @articles = Article.search(keyword)
    render 'articles/index'
  end

  def rakuten_search
    keyword = params[:rakuten_search]
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
