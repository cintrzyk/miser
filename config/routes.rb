Rails.application.routes.draw do
  root 'application#index'

  resources :users, only: [:index, :show]

  post 'signin', to: 'auth#signin', as: :signin
  get 'signout', to: 'auth#signout', as: :signout

  # API
  post 'auth/signup', as: :api_signup
  post 'auth/signin', as: :api_signin
end
