module ApplicationHelper
  def error_messages_for(object)
    render(partial: 'application/error_messages', locals: { object: object })
  end

  def notification(type, color)
    "<div class='notification-#{color}'>#{type}</div>".html_safe if type.present?
  end
end
