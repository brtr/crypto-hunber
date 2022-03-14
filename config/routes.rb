Rails.application.routes.draw do
  root to: "home#index"

  resources :offers, only: [:index, :update] do
    member do
      put :take
      put :complete
    end
  end

  resources :recommend_projects do
    get :unchecked_projects, on: :collection
    member do
      put :toggle_like
      put :check
    end
  end

  resources :comments, only: :create
  resources :users, only: :show

  post 'login', to: "users#login", as: :login
  post 'logout', to: "users#logout", as: :logout
  get 'how-it-works', to: "home#howitworks", as: :howitworks
  get 'roadmap', to: "home#roadmap", as: :roadmap
end
