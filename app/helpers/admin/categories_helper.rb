module Admin::CategoriesHelper
  def category_item(category)
    output = category.name + " "
    output += link_to("编辑", edit_admin_category_path(category)) + " | "
    output += link_to("删除", [:admin, category], :method => "delete", :confirm => "您确定么？")
    output.html_safe
  end

  def admin_treeview(category)
    output = "<li>"

    if category.children.any?
      output << "<span class='folder'>#{category_item(category)}</span>"

      category.children.each{|child_category|
        output << "<ul>"
        output << admin_treeview( child_category )
        output << "</ul>"
      }
    else
      output << "<span class='file'>#{category_item(category)}</span>"
    end

    output << "</li>"

    output.html_safe
  end
end
