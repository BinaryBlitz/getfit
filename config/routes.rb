Rails.application.routes.draw do
  devise_for :trainers, path: 'trainer'

  get 'trainer', to: 'trainer/programs#index'

  namespace :trainer do
    resource :trainer
    resources :posts
    resources :subscriptions, only: [:index, :show]
    resources :exercise_types
    resources :programs do
      resources :exercises, shallow: true
    end
  end

  namespace :api do
    resource :user
    resources :users, only: [:show]
    resources :verification_tokens, only: [:create, :update], param: :token
    resources :exercises, except: [:new, :edit]
    resources :posts, except: [:new, :edit]
    resources :programs, except: [:new, :edit]
  end
end
