Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'welcome/index'
  root 'courses#index'

  resources :books
  resources :tags, only:[:index, :destroy]

  namespace :api do
    namespace :v1 do
      resources :tags, only:[:index]
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
