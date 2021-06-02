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
      out += image_tag article.image, class: 'article-categories-image' if article.image.attached?
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

  def link(articles, index)
    link_to(
      content_tag(:div, nil, class: 'hero-head ml-5 mt-4') do
        content_tag(:p, @categories.find(index + 1).name,
                    class: 'title has-text-white') +
          content_tag(:p, nil, class: 'hero-body pt-6 has-text-white') +
          (content_tag(:p, articles.title, class: 'hero-foot subtitle size-6 mb-2') if articles)
      end,
      article_path(articles), class: 'has-text-black column',
                              style: "background: url('#{display_photo(articles)}') center center; background-size: cover"
    )
  end
  
  def show_articles_by_categories(articles)
    return if articles.nil?

    content_tag(:div, nil, class: 'columns is-gapless') do
      articles.each_with_index do |articles, index|
        concat(link(articles, index))
      end
    end
  end
end
