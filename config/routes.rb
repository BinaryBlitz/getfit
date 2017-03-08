Rails.application.routes.draw do
  devise_for :trainers, path: 'trainer'
  devise_for :admins, path: 'admin', skip: :registrations

  get 'trainer', to: 'trainer/programs#index'
  get 'admin', to: 'admin/programs#index'

  namespace :trainer do
    resource :trainer
    resources :posts
    resources :exercise_types
    resources :statistics, only: :index

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
      resources :programs, only: [:index], controller: :user_programs
    end

    resources :users, only: [:show] do
      resources :statistics, only: :index
    end

    resources :specializations, only: [:index]
    resources :program_types, only: [:index]

    resources :trainers, only: [:index, :show] do
      resource :subscription, only: [:create]
      resources :followings, only: [:create, :destroy], shallow: true
      resources :ratings, only: [:create]
      resources :posts, only: [:index], controller: :trainer_posts
      resources :programs, only: [:index], controller: :trainer_programs
    end

    resources :posts, only: [:index] do
      resources :comments, only: [:index, :create, :destroy], shallow: true

      get 'popular', on: :collection
    end

    resources :subscriptions, only: [:index, :update] do
      resources :messages, only: [:index, :create], shallow: true
    end
    resources :notifications, only: [:index]

    resources :programs, except: [:new, :edit] do
      resources :ratings, except: [:show, :new, :edit], shallow: true
      resource :purchase, only: [:create]
    end

    resources :workouts, only: [:index] do
      resources :exercises, except: [:new, :edit], shallow: true
    end

    resources :workout_sessions, except: [:new, :edit] do
      resources :exercise_sessions, except: [:new, :edit], shallow: true
    end
  end

  namespace :admin do
    resources :trainers, only: [:index, :show] do
      patch 'approve', 'reject', on: :member
    end

    resources :notifications, except: [:edit, :update, :destroy]

    resources :programs, only: [:index, :show, :destroy] do
      resources :workouts, only: [:index], shallow: true

      patch 'approve', 'reject', on: :member
    end
  end
end
