json.partial! 'post', post: @post

json.trainer do
  json.partial! 'api/trainers/trainer_preview', trainer: @post.trainer
end
