json.extract! trainer,
              :id, :first_name, :last_name, :description,
              :avatar_url, :banner_url, :programs_count, :followers_count, :rating

if current_user
  json.following_id current_user.followings.find_by(trainer: trainer)
end
