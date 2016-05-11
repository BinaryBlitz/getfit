json.array! @subscriptions do |subscription|
  json.partial! 'api/subscriptions/subscription', subscription: subscription

  if subscription.messages.last
    json.message_preview do
      json.partial! 'api/messages/message_preview', message: subscription.messages.last
    end
  end
end
