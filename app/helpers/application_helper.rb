module ApplicationHelper

  def flash_class(level)
    case level
      when 'success' then "green"
      when 'error' then "red"
      when 'notice' then "yellow"
    end
  end

  def display_yao(yao)
    klass = 'black' if yao == 1
    klass = 'white' if yao == 0

    "<div class='yao_row'><div class='black'></div><div class='#{klass}'></div><div class='black'></div></div>"
  end

end
