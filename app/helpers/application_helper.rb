# frozen_string_literal: true

module ApplicationHelper # rubocop:todo Style/Documentation
  def show_user(current_user)
    if signed_in?
      "<p class='control'>
        #{link_to current_user.name, user_path(current_user), class: 'button is-info is-inverted mt-2'}</p>
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
      '<p>Creator: This info is available only for members</p>'.html_safe
    end
  end

  def show_attendees(attendees)
    result = '<p>No visitors yet</p>'
    unless attendees.count.zero?
      result = ''
      attendees.each do |attendee|
        result += "<div class='rounded'>#{attendee.name}</p>"
      end
    end
    result.html_safe
  end

  def show_registration_button(event)
    if event.attendances.exists?(user_id: current_user.id)
      '<p>You`re already joined</p>'.html_safe
    else
      link_to 'Join Event', join_attendances_path(id: @event.id), class: 'button is-info is-inverted mt-2',
                                                                  method: :post.to_s.html_safe
    end
  end

  def show_create_event_button
    if current_user # rubocop:todo Style/GuardClause
      (link_to 'Create new event', new_event_path,
               class: 'button is-info is-inverted mt-2 ml-2').to_s.html_safe
    end
  end

  def show_upcoming_events_button
    if current_user # rubocop:todo Style/GuardClause
      (link_to 'Upcoming Events', events_upcoming_path,
               class: 'button is-info is-inverted mt-2 ml-2').to_s.html_safe
    end
  end

  def show_past_events_button
    if current_user # rubocop:todo Style/GuardClause
      (link_to 'Past Events', events_past_path,
               class: 'button is-info is-inverted mt-2 ml-2').to_s.html_safe
    end
  end

  
end
