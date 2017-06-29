Rails.application.routes.draw do
  resources :people
  resources :triggers
  resources :lists

  root to: 'lists#index'
end
