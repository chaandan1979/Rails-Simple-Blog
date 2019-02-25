class Admin::MessagesController < Admin::ApplicationController
  def index
  	if params[:search].present?
        @messages = Message.matching_fullname_or_content(params[:search]).page params[:page]
    else
  		@messages = Message.all.order(id: :desc).page params[:page]
  	end
  end

  def show
  	@message = Message.find(params[:id])
  	@message.mark_read
  end

  def update
  	@message = Message.find(params[:id])  	
  	if @message.update(status: params[:status])
  		redirect_to admin_messages_path, notice: 'Successfully updated message'
  	else
  		redirect_to admin_messages_path, notice: 'There was a problem updating message'
  	end
  end

  def destroy
  	@message = Message.find(params[:id])  	
  	@message.destroy

  	redirect_to admin_messages_path, notice: 'Successfully deleted message'
  end
end
