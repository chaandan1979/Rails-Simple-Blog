class Admin::NotificationsController < Admin::ApplicationController
  def index
  	@visitor_notifications = Notification.where(notifiable_type: 'Visitor').order(id: :desc)
  	@comment_notifications = Notification.where(notifiable_type: 'Comment').order(id: :desc)
  end

  def destroy
  	@notification = Notification.find(params[:id])  	
  	@notification.destroy
  	redirect_to admin_notifications_path, notice: 'Successfully deleted notification.'
  end

  def delete_all
  	Notification.delete_all
  	redirect_to admin_notifications_path, notice: 'All notifications deleted Successfully'
  end
end
