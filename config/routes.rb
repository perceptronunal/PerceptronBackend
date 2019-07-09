Rails.application.routes.draw do
  resources :profilepictures
  #Google Auth Verification
  post 'google_auth' => 'google_auth#create'

  post 'login_token' => 'login_token#create'
  post 'organization_token' => 'organization_token#create'
  post 'user_token' => 'user_token#create'
  get 'users/current' => 'users#current'
  get 'organizations/current' => 'organizations#current'
  get 'logins/current' => 'logins#current'
  #statistics of a post's tag
  get 'statistics/month' => 'statistics#count_month'
  get 'statistics/tag' => 'statistics#count_tag'

  
  post 'contact' => 'contact#contact'

  resources :organizations
  resources :resources
  resources :pets do
    member do
      get 'comments', action: :comments, controller: 'pets'
      get 'adopt', action: :adopt, controller: 'pets'
      post 'comments', action: :create_comments, controller: 'pets'
      post 'interest', action: :create_interest, controller: 'pets'
      post 'adopt', action: :create_adoption, controller: 'pets'
      post 'adopted', action: :confirm_adoption, controller: 'pets'
      post 'found', action: :found, controller: 'pets'
    end
    collection do
      get 'publications', action: :publications, controller: 'pets'
      get 'losts', action: :losts, controller: 'pets'
    end
  end
  resources :comments
  resources :posts do
    member do
      get 'comments', action: :comments, controller: 'posts'
      post 'comments', action: :create_comments, controller: 'posts'
      post 'resources', action: :create_resource, controller: 'posts'
    end
  end
  resources :connections
  resources :users do
    member do
      get 'likes', action: :likes, controller: 'users'
      get 'comments', action: :user_comments, controller: 'users'
    end
    collection do
      post 'upload', action: :upload_profile, controller: 'users'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
