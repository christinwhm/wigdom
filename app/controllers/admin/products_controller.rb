class Admin::ProductsController < ApplicationController
	before_filter :authenticate_user!

  def index
		@products = current_user.products
  end

  def new
		@product = current_user.products.new
  end

  def create
		@product = current_user.products.new(params[:product])

    if @product.save
			redirect_to admin_products_url, :notice => "Done creating the new product!"
    else
      render :action => "new"
    end
  end

  def edit
		@product = current_user.products.find(params[:id])
  end

  def update
		@product = current_user.products.find(params[:id])

    if @product.update_attributes(params[:product])
			redirect_to admin_products_url, :notice => "Done updating the product"
		else
			render :action => "edit"
    end
  end

  def destroy
		@product = current_user.products.find(params[:id])

		@product.destroy

		redirect_to admin_products_url, :notice => "Done destroying the product"
  end
end
