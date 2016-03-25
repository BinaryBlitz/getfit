json.extract! trainer,
              :first_name, :last_name, :phone_number, :description,
              :place_of_work, :avatar_url, :banner_url, :category, :experience

json.specialization do
  json.partial! 'api/specializations/specialization', specialization: trainer.specialization
end
