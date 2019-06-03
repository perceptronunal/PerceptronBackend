Rails.application.routes.draw do
  post 'organization_token' => 'organization_token#create'
  post 'user_token' => 'user_token#create'
  resources :organizations
  resources :resources
  resources :pets
  resources :comments
  resources :posts
  resources :connections
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
