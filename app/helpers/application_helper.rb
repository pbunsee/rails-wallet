module ApplicationHelper
  def current_user
    if session[:user_id]
      current_user = User.find(session[:user_id])
    end
  end

  def errors_for(model)
    if model.errors.any?
      content_tag :ul do
        model.errors.full_messages.map do |msg|
          content_tag :li, msg
        end.join('').html_safe
      end

    end
  end
end
