class CategoriesController < ApplicationController
  # GET /categories or /categories.json
  def index
    @categories = Category.includes(:articles).all
    @articles = Article.all
    @xcat = Category.all.order(:priority)
    @most_popular = @articles.most_popular
    @articles_by_category = []
    @categories.each do |category|
      @articles_by_category << recent_article(category) unless recent_article(category).nil?
    end
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.includes(:articles).find(params[:id])
    recent_related_articles
  end

  private

  def recent_related_articles
    @recent_related_articles ||= @category.articles.ordered_by_most_recent.limit(2)
  end

  def recent_article(category)
    category.articles.ordered_by_most_recent.first
  end
end
