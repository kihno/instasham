Rails.application.routes.draw do
  resources :comments

  devise_scope :user do
    get '/users', to: 'devise/registration#new'
    get 'users/password', to: 'devise/passwords#new'
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [ :show ]

  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
