Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  require 'sidekiq/web'
  authenticate :user, ->(u) { u.admin?  } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root 'courses#index'

  resources :books
  resources :tracks, only: [:index, :show]
  resources :track_courses, only: [:index, :show]
  resources :tags, only: [:index, :destroy]
  resources :profiles, only: [:index, :show]

  namespace :api, constraints: { format: 'json' }, defaults: { format: 'json' } do
    namespace :v1 do
      resources :tags, only: [:index]
      resources :courses, only: [:create, :index]
      resources :file_attachments do
        collection do
          get :exists
          post :sort
        end
      end
    end
  end

  resources :courses do
    member do
      get :file_archive
    end
    resources :favorite_courses, only: [:create, :destroy]
    resources :file_attachments, only: :destroy do
      resource :favorite_file_attachments, only: [:create, :destroy]
    end
    collection do
      get :search
    end
  end
end
