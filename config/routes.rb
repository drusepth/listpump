Rails.application.routes.draw do
  resources :people
  resources :triggers
  resources :lists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
