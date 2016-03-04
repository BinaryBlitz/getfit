Rails.application.routes.draw do
  devise_for :trainers

  namespace :api do
    resource :user
    resources :verification_tokens, only: [:create, :update], param: :token
    resources :exercises, except: [:new, :edit]
    resources :posts, except: [:new, :edit]
    resources :programs, except: [:new, :edit]
  end
end
