module CategoriesHelper
  def treeview(category)
    output = "<li>"

    if category.children.any?
      output << "<span class='folder'>#{link_to(category.name, category)}</span>"

      category.children.each{|child_category|
        output << "<ul>"
        output << treeview( child_category )
        output << "</ul>"
      }
    else
      output << "<span class='file'>#{link_to(category.name, category)}</span>"
    end

    output << "</li>"

    output.html_safe
  end
end
