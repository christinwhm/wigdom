module CategoriesHelper
  def treeview(node)
    output = "<li>"

    if node.children.any?
      output << "<span class='folder'>#{link_to(node.name, node)}</span>"

      node.children.each{|child_node|
        output << "<ul>"
        output << treeview( child_node )
        output << "</ul>"
      }
    else
      output << "<span class='file'>#{link_to(node.name, node)}</span>"
    end

    output << "</li>"

    output.html_safe
  end
end
