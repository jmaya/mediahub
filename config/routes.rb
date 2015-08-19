Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.admin?  } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root 'courses#index'

  resources :books
  resources :tags, only:[:index, :destroy]
  resources :profiles, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :tags, only:[:index]
      resources :courses, only:[:create]
      resources :file_attachments do
        collection do
          get :exists
          post :sort
        end
      end
    end
  end

  resources :courses do
    resources :favorite_courses, only: [:create, :destroy]
    resources :file_attachments, only: :destroy do
      resource :favorite_file_attachments, only: [:create, :destroy]
    end
    collection do
      get :search
    end
  end
end
