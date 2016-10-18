json.partial! 'api/trainers/trainer', trainer: @trainer

if current_user
  json.following_id current_user.followings.find_by(trainer: @trainer).try(:id)
end
