module ArticlesHelper
  def admin_create_article
    if current_user && current_user.admin
      link_to 'New Article', new_article_path
    end
  end

  def articles_controller
    out = ''
    @articles.each do |article|
      out += "<tr>"
      out += "<td>#{link_to 'Show', article}</td>"
      out += "<td>#{link_to 'Edit', edit_article_path(article)}</td>"
      out += "<td>#{link_to 'Destroy', article, method: :delete, data: { confirm: 'Are you sure?' }}</td>"
      out += "</tr>"
    end
    out.html_safe
  end
end

