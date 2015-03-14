Rails.application.routes.draw do
  root to: "pages#index"

  resources :pipes do
    resources :flows
    resources :transforms
  end

  resources :endpoints
  get "endpoints/:id/push" => "endpoints#push"
end
