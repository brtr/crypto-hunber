Rails.application.routes.draw do
  root to: "offers#index"

  resources :offers, only: :index do
    member do
      put :take
      put :complete
    end
  end

  resources :recommend_projects do
    put :toggle_like, on: :member
  end

  resources :comments, only: :create

  post 'login', to: "users#login", as: :login
  post 'logout', to: "users#logout", as: :logout
end
