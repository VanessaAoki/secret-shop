class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def show
    @category = Category.includes(:articles).find(params[:id])
    recent_related_articles
  end
end
