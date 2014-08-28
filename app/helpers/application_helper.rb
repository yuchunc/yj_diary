module ApplicationHelper

  def flash_class(level)
    case level
      when 'success' then "green"
      when 'error' then "red"
      when 'notice' then "yellow"
    end
  end
end
