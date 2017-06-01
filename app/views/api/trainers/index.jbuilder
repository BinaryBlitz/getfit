json.array! @trainers do |trainer|
  json.partial! 'api/trainers/trainer', trainer: trainer

  if current_user
    json.following_id current_user.followings.find_by(trainer: trainer).try(:id)
    json.rating_id current_user.ratings.find_by(ratable: trainer).try(:id)
  end
end
