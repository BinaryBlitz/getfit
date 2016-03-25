Rails.application.routes.draw do
  devise_for :trainers, path: 'trainer'

  get 'trainer', to: 'trainer/programs#index'

  namespace :trainer do
    resource :trainer
    resources :posts
    resources :subscriptions, only: [:index, :show]
    resources :exercise_types

    resources :programs do
      resources :stages, only: [:index, :new, :create], shallow: true
    end

    resources :stages, except: [:show, :index, :new, :create] do
      resources :exercises, shallow: true
    end
  end

  namespace :api do
    resources :verification_tokens, only: [:create, :update], param: :token
    resource :user do
      post 'authenticate_vk', 'authenticate_fb', on: :collection
    end
    resources :users, only: [:show]
    resources :posts, except: [:new, :edit]

    resources :trainings
    resources :programs, except: [:new, :edit] do
      resources :stages, except: [:new, :edit], shallow: true do
        resources :exercises, except: [:new, :edit], shallow: true
      end
    end
  end
end
