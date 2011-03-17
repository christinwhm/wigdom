class CategoriesController < ApplicationController
  def show
    category = Category.find(params[:id])
    @products = Product.by_category(category)

    if request.xhr?
      render :layout => false
    end
  end
end
