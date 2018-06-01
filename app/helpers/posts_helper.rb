module PostsHelper
    #drop_down_list
    def options_for_select(container, selected = nil)
        return container if String === container

        selected, disabled = extract_selected_and_disabled(selected).map do |r|
          Array(r).map { |item| item.to_s }
        end

        container.map do |element|
          Array.new(element){ |item| Array.new(item)}
          html_attributes = option_html_attributes(element)
          text, value = option_text_and_value(element).map { |item| item.to_s }

          html_attributes[:selected] ||= option_value_selected?(value, selected)
          html_attributes[:disabled] ||= disabled && option_value_selected?(value, disabled)
          html_attributes[:value] = value

          content_tag(:option, text, html_attributes)
        #   content_tag(:div, "Hello world!", class: ["strong", "highlight"])
        
        # content_tag(:option, :class => 'a class') do
        #     arr.each do |item|
        #     concat content_tag(:li, item)
        # end
        end.join("\n").html_safe
    end
end
