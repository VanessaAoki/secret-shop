module ArticlesHelper
  def articles_controller(article)
    out = '<div>'
    if current_user.admin == true
      out += link_to 'Edit', edit_article_path(@article), class: 'button is-warning is-outlined mr-2'
      out += button_to 'Delete', article, method: :delete, data: { confirm: 'Are you sure?' },
                                          class: 'button is-danger is-outlined mr-2'
    end
    out += link_to 'Home', articles_path, class: 'button is-primary is-outlined'
    out += '</div>'
    out.html_safe
  end

  def show_new_article_list(articles)
    out = ''
    articles.each do |article|
      out += '<div class="column p-0 article-categories is-3">'
      out += '<div class="dummy"></div>'
      out += image_tag article.image, class: 'article-categories-image'
      out += '</div>'
      out += '<div class="column p-5 article-news is-3 has-background-white has-text-main has-text-weight-bold">'
      out += '<h1 class="has-text-accent">News</h1>'
      out += "<h2 class=\"my-5 has-text-weight-semibold\">#{article.title}</h2>"
      out += "<p class=\"mb-5 has-text-weight-normal articles-news-main\">#{article.text}</p>"
      out += "<span class=\"mb-5 has-text-accent is-size-09 has-text-weight-normal\">#{link_to 'Read More',
                                                                                               article_url(article)}"
      out += '</span>'
      out += '</div>'
    end
    out.html_safe
  end
end
