class Admin::ProductsController < AdminController
  before_filter :category_required, :only => [:new, :edit, :create, :update]

  uses_tiny_mce :only => [:new, :edit, :create, :update]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      redirect_to admin_products_url, :notice => "Done creating the new product!"
    else
      render :action => "new"
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      redirect_to admin_products_url, :notice => "Done updating the product"
    else
      render :action => "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy

    redirect_to admin_products_url, :notice => "Done destroying the product"
  end

  private
  def category_required
    if Category.count == 0
      redirect_to new_admin_category_path, :alert => "You need to create at least one category first!"
    end
  end
end
