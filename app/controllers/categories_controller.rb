class CategoriesController < ApplicationController
  layout false

  def show
    category = Category.find(:first, :conditions => ["name=?", params[:id]])
    @products = Product.by_category(category)
  end
end
