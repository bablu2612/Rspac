Rails.application.routes.draw do
  root 'page#index'
  get 'page/index'
  resources :posts
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
