class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if verify_recaptcha
      if @message.save
        redirect_to root_url, :notice => "Done sending the message."
      else
        flash[:alert] = "Failed sending the message."
        render :action => "new"
      end
    else
      flash[:alert] = "Invalid captcha!"
      render :action => "new"
    end
  end
end
