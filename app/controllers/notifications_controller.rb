class NotificationsController < ApplicationController

  def create
    @notification = Notification.new(notification_params)
    UserNotifier.notify(
                                 @notification.to,
                                 @notification.from,
                                 @notification.subject,
                                 @notification.body
                                 ).deliver
    
    redirect_to programs_path, notice: "Your email has been sent!"
  end

  def notification_params
    params.require(:notification).permit(:to, :from, :subject, :body)
  end
end