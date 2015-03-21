module ApplicationHelper
  def base_name(full_path)
    File.basename full_path
  end
end