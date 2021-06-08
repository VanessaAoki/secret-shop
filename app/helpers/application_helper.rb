module ApplicationHelper
  def user_navbar
    out = ''
    if user_signed_in?
      out += '<p>'
      out += link_to current_user.name, edit_user_registration_path, class: 'button is-navbar is-capitalize is-size-09'
      out += '</p>'
      out += '<span class="is-flex is-align-items-center has-text-navbar has-text-weight-bold">|</span>'
      out += '<p>'
      out += link_to 'LogOut', destroy_user_session_path, method: :delete, class: 'button is-navbar is-size-09'
    else
      out += '</p>'
      out += '<p>'
      out += link_to 'LogIn', new_user_session_path, class: 'button is-navbar is-size-09'
      out += '</p>'
      out += '<span class="is-flex is-align-items-center has-text-navbar has-text-weight-bold">|</span>'
      out += '<p>'
      out += link_to 'Register', new_user_registration_path, class: 'button is-navbar is-size-09'
      out += '</p>'
    end
    out.html_safe
  end

  def admin_create_article
    out = ''
    if user_signed_in?
      out += '<p>'
      out += link_to 'New Article', new_article_path, class: 'button is-navbar is-capitalize is-size-09'
      out += '</p>'
      out += '<span class="is-flex is-align-items-center has-text-navbar has-text-weight-bold">|</span>'
    end
    out.html_safe
  end

  def render_sign_in
    out = ''
    if current_user
      out += link_to(current_user.name, user_path(id: current_user.id))
      out += link_to('Sign out', destroy_user_session_path, method: :delete)
    else
      out += link_to('Sign in', user_session_path)
    end
    out.html_safe
  end
end
