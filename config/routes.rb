Rails.application.routes.draw do
  resources :private_messages
  resources :room_messages
  resources :rooms
  resources :users
  post '/users/sign_in', to: "sessions#create"
  post '/users/sign_out', to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
