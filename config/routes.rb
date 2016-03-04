Rails.application.routes.draw do
  devise_for :trainers

  namespace :api do
    resource :user
    resources :exercises, except: [:new, :edit]
    resources :posts, except: [:new, :edit]
    resources :programs, except: [:new, :edit]
  end
end
