module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def get_status_color(status)
    case status
    when "COMPLETE"
      "success"
    when "INCOMPLETE"
      "danger"
    else
      "secondary"
    end
  end
end
