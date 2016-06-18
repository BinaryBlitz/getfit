class API::NotificationsController < API::APIController
  def index
    @notifications = Notification.order(created_at: :desc).page(params[:page])
  end
end
