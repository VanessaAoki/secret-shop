module ArticlesHelper
  def articles_controller(article)
    out = '<div class="is-flex">'
    if current_user.admin == true || current_user.id == article.author_id
      out += link_to 'Edit', edit_article_path(@article), class: 'button is-warning mr-2'
      out += button_to 'Delete', article, method: :delete, class: 'button is-danger mr-2'
    end
    out += '</div>'
    out.html_safe
  end

  def default_image(article)
    if article.image.attached?
      image_tag article.image
    else
      image_tag('/assets/news.jpg')
    end
  end

  def default_image_popular(article)
    if article.image.attached?
      image_tag article.image, class: 'article-main-image'
    else
      image_tag '/assets/news.jpg', class: 'article-main-image'
    end
  end

  def new_default_image(article)
    if article.image.attached?
      image_tag article.image, class: 'article-categories-image'
    else
      image_tag '/assets/news.jpg', class: 'article-categories-image'
    end
  end

  def show_new_article_list(_articles)
    out = ''
    @news = Category.find(1)
    @news.articles.each do |article|
      out += '<div class="column p-0 article-categories is-3">'
      out += '<div class="dummy"></div>'
      out += new_default_image(article)
      out += '</div>'
      out += '<div class="column p-5 article-news is-3 has-background-white has-text-main has-text-weight-bold">'
      out += '<h1 class="has-text-accent">News</h1>'
      out += "<h2 class=\"my-5 has-text-weight-semibold\">#{link_to article.title, article_url(article)}</h2>"
      out += "<p class=\"mb-5 has-text-weight-normal articles-news-main\">#{article.text}</p>"
      out += "<span class=\"mb-5 has-text-accent is-size-09 has-text-weight-normal\">#{link_to 'Read More',
                                                                                               article_url(article)}"
      out += '</span>'
      out += '</div>'
    end
    out.html_safe
  end

  def releases_default_image(article)
    if article.image.attached?
      image_tag article.image, class: 'article-categories-image'
    else
      image_tag '/assets/2021.jpg', class: 'article-categories-image'
    end
  end

  def show_releases_article_list(_articles)
    out = ''
    @releases = Category.find(4)
    @releases.articles.each do |article|
      out += '<div class="column p-5 article-news is-3 has-background-white has-text-main has-text-weight-bold">'
      out += '<h1 class="has-text-accent">Latest Releases</h1>'
      out += "<h2 class=\"my-5 has-text-weight-semibold\">#{link_to article.title, article_url(article)}</h2>"
      out += "<p class=\"mb-5 has-text-weight-normal articles-news-main\">#{article.text}</p>"
      out += "<span class=\"mb-5 has-text-accent is-size-09 has-text-weight-normal\">#{link_to 'Read More',
                                                                                               article_url(article)}"
      out += '</span>'
      out += '</div>'
      out += '<div class="column p-0 article-categories is-3">'
      out += '<div class="dummy"></div>'
      out += releases_default_image(article)
      out += '</div>'
    end
    out.html_safe
  end

  def show_patch_article_list(_articles)
    out = ''
    @patch = Category.find(3)
    @patch.articles.each do |article|
      out += "<li class=\"is-align-self-flex-end has-text-accent\">#{article.created_at.to_s(:time)}</li>"
      out += "<li class=\"mb-4\">#{link_to article.title, article_url(article),
                                           class: 'patch-link is-family-monospace is-uppercase'}</li>"
    end
    out.html_safe
  end

  def show_category(article)
    out = ''
    article.categories.each do |category|
      out += link_to category.name, category_url(category), class: 'button is-small is-main'
    end
    out.html_safe
  end
end
