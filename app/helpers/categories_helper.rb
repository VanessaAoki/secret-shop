module CategoriesHelper
  def show_article(category)
    out = "<div class=\"columns is-multiline m-0\">"
    category.articles.each do |article|
      article.categories.each do |category|
        out += "<article class=\"columns column is-12 categories-show p-0 m-0 mb-4\">"
        out += "<div class=\"column is-4 image-container p-0\">"
        out += image_tag article.image, class: 'categories-show-image px-5' if article.image.attached?
        out += '</div>'
        out += '<div class="column is-8 p-4 article-news has-background-white has-text-main is-flex is-flex-direction-column is-justify-content-space-around">'
        out += "<h2 class=\"has-text-weight-semibold\">#{article.title}</h2>"
        out += "<p class=\"has-text-weight-normal articles-news-main\">#{article.text}</p>"
        out += "<span class=\"has-text-accent is-size-09 has-text-weight-normal\">#{link_to 'Read More', article_url(article)}"
        out += '</span>'
        out += '</div>'
        out += '</article>'
        out += '</div>'
      end
    end
    out.html_safe
  end

  def show_events(category)
    out = ''
    category.articles.each do |article|
      article.categories.each do |category|
        out += "<article class=\"my-3\">"
        out += "<span>#{article.text}</span>"
        out += "<p class=\"is-size-5 has-text-weight-semibold\">#{article.title}</p>"
        out += '</article>'
      end
    end
    out.html_safe
  end

  def no_recent
    out = ''
    if @recent_related_articles.empty?
      out += "<p class=\"has-text-main my-6\">There are no articles in this category yet.</p>"
    end
    out.html_safe
  end
end
