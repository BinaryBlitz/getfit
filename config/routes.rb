Rails.application.routes.draw do
  resources :exercises
  resources :posts
  resources :programs
  resources :users

  devise_for :trainers
end
