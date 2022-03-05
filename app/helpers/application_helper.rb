module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def get_status_color(status)
    case status
    when 2
      "success"
    when 1
      "danger"
    else
      "default"
    end
  end

  def check_project_liked(project_like_ids)
    current_user.id.in?(project_like_ids)
  end

  def get_tags(tags)
    tags.order("taggings_count DESC").map do |t|
      "<span class='btn-tag'>##{t.name}</span>"
    end.join(' ').html_safe
  end

  def date_format(datetime)
    datetime.strftime('%Y-%m-%d')
  end

  def get_logo(logo_url)
    logo_url || asset_url("placeholder.png")
  end

  def is_admin?
    admin_ids = ENV.fetch("ADMIN_IDS"){""}.split(',')
    current_user && current_user.id.to_s.in?(admin_ids)
  end

  def address_format(address)
    address[6...-4] = "...."
    address
  end
end
