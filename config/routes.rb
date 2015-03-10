Rails.application.routes.draw do
  root to: "pages#index"
  resources :pipes
  resources :flows
  resources :transforms
end
