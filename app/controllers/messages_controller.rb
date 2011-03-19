class MessagesController < ApplicationController
  def create
    if verify_recaptcha
      @message = Message.new(params[:message])
      if @message.save
        redirect_to root_url, :notice => "Done sending the message."
      else
        render :action => "new"
      end
    else
      render :action => "new"
    end
  end
end
