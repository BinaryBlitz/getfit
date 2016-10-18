json.cache! do
  json.extract! trainer,
                :id, :first_name, :last_name, :phone_number, :description,
                :place_of_work, :avatar_url, :banner_url, :category,
                :experience, :rating, :followers_count

  json.specialization do
    json.partial! 'api/specializations/specialization', specialization: trainer.specialization
  end
end
