json.array! @posts do |post|
  json.partial! 'api/posts/post', post: post

  if current_user
    json.like_id current_user.likes.find_by(post: post).try(:id)
  end

  json.trainer do
    json.partial! 'api/trainers/trainer_preview', trainer: post.trainer
  end
end
