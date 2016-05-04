class Trainer::UserNotificationsController < ApplicationController
  before_action :set_subscription, only: [:create]

  def create
    @user_notification = @subscription.user_notifications.create
    redirect_to trainer_program_path(@user_notification.subscription.program)
  end

  private

  def set_subscription
    @subscription = current_trainer.subscriptions.find(params[:subscription_id])
  end
end
