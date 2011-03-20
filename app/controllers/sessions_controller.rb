class SessionsController < Devise::SessionsController
  def create
    if verify_recaptcha
      super
    else
      render_with_scope "new"
    end
  end
end
