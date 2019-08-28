Rails.application.routes.draw do
  resources :categorizations
  resources :categories
  resources :people
  resources :triggers
  resources :lists
  resources :list_inclusions

  root to: 'lists#index'
end
