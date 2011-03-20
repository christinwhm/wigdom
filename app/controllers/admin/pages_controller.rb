class Admin::PagesController < AdminController
  uses_tiny_mce :only => [:edit, :update]

  def index
    @pages = Page.all(:select => "id, name")
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(params[:page])
      redirect_to admin_pages_path, :notice => "Done updating the page."
    else
      render :action => "edit"
    end
  end
end
