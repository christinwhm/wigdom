class PagesController < ApplicationController
  def contact
    @page = Page.where(:name => "contact").first
  end

  def about
    @page = Page.where(:name => "about").first
  end
end
