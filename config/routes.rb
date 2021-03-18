Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users
    resources :activities
    resources :device_tokens
    resources :school_class

    post :login, to: 'users#login', as: :login
    delete :logout, to: 'users#logout', as: :logout
  end
end
