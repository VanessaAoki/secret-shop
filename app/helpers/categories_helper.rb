module CategoriesHelper
  def show_article(category)
    out = "<div class=\"columns is-multiline\">"
    category.articles.each do |article|
      article.categories.each do |category|
        out += "<div class=\"column is-4 image-container\">"
        out += image_tag article.image, class: 'categories-show-image' if article.image.attached?
        out += '</div>'
        out += '<div class="column is-8 p-5 article-news has-background-white has-text-main has-text-weight-bold">'
        out += "<h2 class=\"my-5 has-text-weight-semibold\">#{article.title}</h2>"
        out += "<p class=\"mb-5 has-text-weight-normal articles-news-main\">#{article.text}</p>"
        out += "<span class=\"mb-5 has-text-accent is-size-09 has-text-weight-normal\">#{link_to 'Read More', article_url(article)}"
        out += '</span>'
        out += '</div>'
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
