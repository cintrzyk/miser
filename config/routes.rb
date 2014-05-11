Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined? JasmineRails

  root 'application#index'

  post 'signin', to: 'auth#signin', as: :signin
  get  'signout', to: 'auth#signout', as: :signout
  get  'users/confirmation/:token', to: 'auth#confirmation'

  # API
  resources :users, only: [:index, :show]

  get  'users/confirmation', as: :api_confirmation
  post 'auth/signup', as: :api_signup
  post 'auth/signin', as: :api_signin
end
