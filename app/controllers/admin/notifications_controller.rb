class Admin::NotificationsController < Admin::AdminController
  def index
    @notifications = Notification.all
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      redirect_to admin_notifications_url, notice: 'Notification was successfully created.'
    else
      render :new
    end
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
    params.fetch(:notification, {}).permit(:content, :image, :image_cache)
  end
end
