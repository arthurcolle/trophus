class MessagesController < ApplicationController
  before_action :authenticate_user!
 
  def new
  	@user = User.find_by(id: params[:user])
  end
 
  def create
    recipient = User.find(params[:user])
    recipient.notify("#{current_user.name} sent you a message!", "xyz")
    conversation = current_user.send_message(recipient, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
    channel = 'private-' + recipient.id.to_s
    puts "CHANNEL"
    @a = current_user.name
    @b = recipient.name
    puts channel
    Pusher[channel].trigger('my_event', {
      message: '1 new message'
    })
  end
end