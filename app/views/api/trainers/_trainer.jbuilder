json.cache! trainer do
  json.extract! trainer,
                :id, :first_name, :last_name, :description,
                :avatar_url, :banner_url, :category, :rating, :followers_count

  json.specialization do
    json.partial! 'api/specializations/specialization', specialization: trainer.specialization
  end
end
