# frozen_string_literal: true

module ApplicationHelper
  
  def show_user(current_user)
    if signed_in?
      "<p class='control'>
                #{link_to 'New Event', events_path, class: 'button is-info is-inverted mt-2'}
              </p>
      <p class='control'>
        #{link_to current_user.name, user_path(current_user), class: 'button is-info is-inverted mt-2'}
        </p>
          <p class='control'>
            #{link_to 'Logout', destroy_user_session_path, method: :delete, class: 'button is-info is-inverted mt-2'}
          </p>".html_safe
    else
      "<p class='control'>
          #{link_to 'Sign in', new_user_session_path, class: 'button is-info is-inverted mt-2'}
          #{link_to 'Sign up', new_user_registration_path, class: 'button is-info is-inverted mt-2'}
        </p>".html_safe
    end
  end

  def show_creator(event)
    if signed_in?
      "<p>Creator: #{event.creator.name}</p>".html_safe
    else
      '<p>Creator: Noname</p>'.html_safe
    end
  end
end
