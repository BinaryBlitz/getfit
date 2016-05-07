Rails.application.routes.draw do
  devise_for :trainers, path: 'trainer'
  devise_for :admins, path: 'admin', skip: :registrations

  get 'trainer', to: 'trainer/programs#index'
  get 'admin', to: 'admin/notifications#index'

  namespace :trainer do
    resource :trainer
    resources :posts
    resources :exercise_types

    resources :subscriptions, only: [:index, :show] do
      resources :messages, only: [:index, :create], shallow: true
      resources :user_notifications, only: [:create], shallow: true
    end

    resources :programs do
      resources :workouts, only: [:index, :new, :create], shallow: true
    end

    resources :workouts, except: [:show, :index, :new, :create] do
      resources :exercises, shallow: true
    end
  end

  namespace :api do
    resources :verification_tokens, only: [:create, :update], param: :token

    resource :user do
      post 'authenticate_vk', 'authenticate_fb', on: :collection
    end

    resources :users, only: [:show] do
      resources :statistics, only: :index
    end

    resources :trainers, only: [:index]

    resources :posts, except: [:new, :edit] do
      resources :likes, only: [:create, :destroy], shallow: true
      resources :comments, only: [:index, :create, :destroy], shallow: true

      get 'popular', on: :collection
    end

    resources :subscriptions, only: [:index] do
      resources :messages, only: [:index], shallow: true
    end

    resources :programs, except: [:new, :edit] do
      resources :ratings, except: [:show, :new, :edit], shallow: true

      resources :workouts, except: [:new, :edit], shallow: true do
        resources :exercises, except: [:new, :edit], shallow: true
      end
    end

    resources :workout_sessions, except: [:new, :edit] do
      resources :exercise_sessions, except: [:new, :edit], shallow: true
    end
  end

  namespace :admin do
    resources :notifications, except: [:edit, :update, :destroy]
  end
end
