json.extract! trainer,
              :id, :first_name, :last_name, :phone_number, :description,
              :place_of_work, :avatar_url, :banner_url, :category, :experience, :rating

if current_user
  json.following_id current_user.followings.find_by(trainer: trainer)
end

json.specialization do
  json.partial! 'api/specializations/specialization', specialization: trainer.specialization
end
