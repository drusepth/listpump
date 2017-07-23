Rails.application.routes.draw do
  resources :categories
  resources :people
  resources :triggers
  resources :lists

  root to: 'lists#index'
end
