Rails.application.routes.draw do
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  # Defines the root path route ("/")
  # root "articles#index"
end
