class AdminController < ActionController::Base
  layout "admin"
  before_filter :authenticate_admin!

  protect_from_forgery
end
