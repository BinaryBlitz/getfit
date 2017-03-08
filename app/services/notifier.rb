class Notifier
  def initialize(user, message, options = {})
    return unless user.device_token.present?

    @user = user
    @device_token = user.device_token
    @platform = user.platform
    @message = message
    @options = options

    push
  end

  def push
    return if @message.blank? || @device_token.blank?

    Rails.logger.debug "#{Time.zone.now} Notifying #{@user} with message: #{@message}"

    case @platform
    when 'android'
      push_android_notification
    when 'ios'
      push_ios_notification
    end
  end

  private

  def push_android_notification
    return if @message.blank? || @device_token.blank?
    # Send GCM notification
    Rails.logger.debug "#{Time.zone.now} GCM notification: #{@message}, user: #{@user.id}"
  end

  def push_ios_notification
    # Send APNS notification
    Rails.logger.debug "#{Time.zone.now} iOS notification: #{@message}, user: #{@user.id}"
  end
end
