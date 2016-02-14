Rails.application.routes.draw do
  resources :posts
  resources :programs
  resources :users

  devise_for :trainers
end
