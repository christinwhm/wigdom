class MessagesController < ApplicationController
  def create
    @message = Message.new(params[:message])
    if @message.save
      redirect_to root_url, :notice => "Done posting the message."
    else
      render :action => "new"
    end
  end
end
