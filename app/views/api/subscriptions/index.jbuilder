json.array! @subscriptions do |subscription|
  json.partial! 'api/subscriptions/subscription', subscription: subscription

  json.trainer do
    json.partial! 'api/trainers/trainer_preview', trainer: subscription.trainer
  end

  if subscription.messages.last
    json.message_preview do
      json.partial! 'api/messages/message_preview', message: subscription.messages.last
    end
  end
end
