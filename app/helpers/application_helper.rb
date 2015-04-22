module ApplicationHelper
  include ActsAsTaggableOn::TagsHelper

  def show_file_size(file_size)
    return number_to_human_size(0) unless file_size
    number_to_human_size file_size
  end

  def base_name(full_path)
    full_path.split("\/")[-1]
  end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info"  }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert'  }) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat message
      end)
    end
    nil
  end

  def active_chooser(params_in)
    case params_in[:controller]
    when 'courses'
      'active'
    end
  end

  def video_content_type_for(content_type)
    return "" if content_type.nil?
    return "video/mp4" if content_type.end_with?("mp4")
    return "video/ogg" if content_type.end_with?("ogg")
    return "video/webm" if content_type.end_with?("weebm")
    content_type
  end
end
