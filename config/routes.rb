Rails.application.routes.draw do
  resources :categorizations
  resources :categories
  resources :people
  resources :triggers
  resources :lists

  root to: 'lists#index'
end
