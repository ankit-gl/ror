Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "auth#index"
  get 'signup', to: 'auth#signup'
  post 'signup', to: 'auth#createAccount'
  get 'login', to: 'auth#index'
  post 'login', to: 'auth#login'
  delete 'logout', to: 'auth#logout'
  get 'home', to: 'book#list'
  get 'book/list'
  get 'book/new'
  post 'book/create'
  patch 'book/update'
  get 'book/show'
  get 'book/edit'
  get 'book/delete'
  get 'book/update'
  get 'book/show_subjects'
end
