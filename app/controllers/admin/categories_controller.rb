class Admin::CategoriesController < ApplicationController
  layout "admin"
  before_filter :authenticate_admin!
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to admin_categories_url, :notice => "Done creating the new category!"
    else
      render :action => "new"
    end
  end

  def edit
    @category = Category.find(params[:id])
    @others = Category.all - [@category]
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      redirect_to admin_categories_url, :notice => "Done updating the category"
    else
      render :action => "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])

    @category.destroy

    redirect_to admin_categories_url, :notice => "Done destroying the category"
  end
end
