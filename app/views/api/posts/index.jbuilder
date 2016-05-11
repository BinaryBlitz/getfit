json.array! @posts do |post|
  json.partial! 'api/posts/post', post: post

  json.trainer do
    json.partial! 'api/trainers/trainer_preview', trainer: post.trainer
  end
end
