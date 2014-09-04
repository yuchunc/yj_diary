module ApplicationHelper

  def flash_class(level)
    case level
      when 'success' then "green"
      when 'error' then "red"
      when 'notice' then "yellow"
    end
  end

  def display_yao(yao)
    klass = 'yang yao' if yao == 1
    klass = 'ying yao' if yao == 0

  end
end
