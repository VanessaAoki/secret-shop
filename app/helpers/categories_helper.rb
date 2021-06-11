# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/ModuleLength
module CategoriesHelper
  def show_all_categories
    out = ''
    categories = Category.all
    categories.each do |category|
      out += '<div class="is-flex is-justify-content-space-between pl-4 pr-6 py-2">'
      out += link_to category.name, category_url(category), class: 'patch-link is-family-monospace is-uppercase'
      out += "<p class=\"button is-small is-rounded is-accent\">#{category.articles.count}</p>"
      out += '</div>'
    end
    out.html_safe
  end

  def show_article_default_image(article)
    if article.image.attached?
      image_tag article.image, class: 'categories-show-image px-5'
    else
      image_tag '/assets/news.jpg', class: 'categories-show-image px-5'
    end
  end

  def show_article(category)
    out = '<div class="columns is-multiline m-0">'
    category.articles.ordered_by_most_recent.each do |article|
      out += '<article class="columns column is-12 categories-show p-0 m-0 mb-4">'
      out += '<div class="column is-4 image-container p-0">'
      out += show_article_default_image(article)
      out += '</div>'
      out += '<div class="column is-8 p-4 article-news has-background-white has-text-main is-flex is-flex-direction-column is-justify-content-space-around">'
      out += "<h2 class=\"has-text-weight-semibold\">#{link_to article.title, article_url(article)}</h2>"
      out += "<p class=\"has-text-weight-normal articles-news-main\">#{article.text}</p>"
      out += "<span class=\"has-text-accent is-size-09 has-text-weight-normal\">#{link_to 'Read More',
                                                                                          article_url(article)}"
      out += '</span>'
      out += '</div>'
      out += '</article>'
    end
    out += '</div>'
    out.html_safe
  end

  def show_events(category)
    out = ''
    category.articles.each do |article|
      out += '<article class="my-3">'
      out += "<span>#{article.text}</span>"
      out += "<p class=\"is-size-5 has-text-weight-semibold\">#{article.title}</p>"
      out += '</article>'
    end
    out.html_safe
  end

  def no_recent
    out = ''
    if @recent_related_articles.empty?
      out += '<p class="has-text-main my-6">There are no articles in this category yet.</p>'
    end
    out.html_safe
  end

  def show_latest(category)
    out = ''
    category.articles.each do |article|
      article.categories.each do |cat|
        out += link_to cat.name, category_url(cat), class: 'four-category is-size-5 has-text-weight-bold ml-2'
        out += link_to cat.articles.last.title, article_url(article), class: 'four-title has-text-weight-bold ml-2'
      end
    end
    out.html_safe
  end

  def show_latest_main_image(article)
    if article.image.attached?
      image_tag article.image, class: 'article-categories-image'
    else
      image_tag '/assets/news.jpg', class: 'article-categories-image'
    end
  end

  def show_latest_main(category)
    out = ''
    category.articles.each do |article|
      article.categories.each do |cat|
        out += link_to cat.name, category_url(cat), class: 'four-category is-size-5 has-text-weight-bold ml-2'
        out += link_to cat.articles.last.title, article_url(article), class: 'four-title has-text-weight-bold ml-2'
        out += '<div class="dummy"></div>'
        out += show_latest_main_image(article)
      end
    end
    out.html_safe
  end

  def show_first(category)
    out = ''
    category.articles.each do |article|
      article.categories.each do |cat|
        out += link_to cat.name, category_url(cat), class: 'four-category is-size-5 has-text-weight-bold ml-2'
        out += link_to cat.articles.first.title, article_url(article),
                       class: 'four-title has-text-weight-bold ml-2 is-family-monospace is-uppercase'
      end
    end
    out.html_safe
  end

  def popular_article(category)
    out = ''
    category.articles.each do |article|
      article.categories.each do |cat|
        out += link_to cat.name, category_url(cat), class: 'four-category is-size-5 has-text-weight-bold ml-2'
        out += link_to cat.articles.most_popular.title, article_url(article), class: 'four-title has-text-weight-bold ml-2'
      end
    end
    out.html_safe
  end
end
# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/ModuleLength
