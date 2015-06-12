class MessagesController < ApplicationController
  before_action :authenticate_user!
 
  def new
  	@user = User.find_by(id: params[:user])
  end
 
  def create
    recipient = User.find(params[:user])
    recipient.notify("#{current_user.name} sent you a message!", "Filler");
    msg_body = params[:message][:body]
    msg_subj = params[:message][:subject]
    conversation = current_user.send_message(recipient, msg_body, msg_subj).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
    # naming convention for server-client channels is 'private-<%= id %>'
    channel = 'private-' + recipient.id.to_s
    # push notification to trigger the
    Pusher[channel].trigger('my_event', {
      message: '1 new message'
    })
  end
end