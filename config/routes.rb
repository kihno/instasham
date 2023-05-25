Rails.application.routes.draw do
  resources :likes, only: [:create, :destroy]
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

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  resources :posts

  root "posts#index"
end
