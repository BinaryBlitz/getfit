Rails.application.routes.draw do
  resources :programs
  resources :users

  devise_for :trainers
end
