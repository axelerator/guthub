Rails.application.routes.draw do
  resources :roles
  resources :accounts do
    member do
      post :upgrade_plan
    end
  end
  resources :plans
  root :to => 'users#index'
  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
