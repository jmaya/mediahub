Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  resources :books

  resources :courses

end
