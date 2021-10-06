# frozen_string_literal: true

module ApplicationHelper
  def show_user(current_user)
    if signed_in?
      "<p class='control mt-2'>
        #{link_to current_user.name, user_path(current_user)}
        </p>
          <p class='control'>
            #{link_to 'Logout', destroy_user_session_path, method: :delete, class: 'button is-info'}
          </p>".html_safe
    else
      "<p class='control'>
          #{link_to 'Sign in || Sign up', new_user_registration_path, class: 'button is-info'}
        </p>".html_safe
    end
  end
end
