module ApplicationHelper
  def user_navbar
    out = ''
    if user_signed_in?
      out += '<p>'
      out += link_to current_user.name, edit_user_registration_path, class: 'button is-navbar is-uppercase is-size-09'
      out += '</p>'
      out += "<span class=\"is-flex is-align-items-center has-text-navbar has-text-weight-bold\">|</span>"
      out += '<p>'
      out += link_to 'LOGOUT', destroy_user_session_path, method: :delete, class: 'button is-navbar is-size-09'
    else
      out += '</p>'
      out += '<p>'
      out += link_to 'LOGIN', new_user_session_path, class: 'button is-navbar is-size-09'
      out += '</p>'
      out += "<span class=\"is-flex is-align-items-center has-text-navbar has-text-weight-bold\">|</span>"
      out += '<p>'
      out += link_to 'REGISTER', new_user_registration_path, class: 'button is-navbar is-size-09'
      out += '</p>'
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
