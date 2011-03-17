class MessagesController < ApplicationController
  def create
    @message = Message.new(params[:message])
    if @message.save
      redirect_to root_url, :notice => "Done posting the message."
    else
      redirect_to contact_url, :alert => "Failed posting the message."
    end
  end
end
