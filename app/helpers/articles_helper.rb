module ArticlesHelper
  def admin_create_article
    if current_user && current_user.admin
      link_to 'New Article', new_article_path
    end
  end
  
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
end

