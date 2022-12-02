Rails.application.routes.draw do
  resources :payment_accounts
  get '/organization' => "organization#index"
  resources :orders do
    collection do
      get 'current'
      post 'add'
      post 'remove'
    end
  end

  passwordless_for :users, at: '/', as: :auth
  resources :books
  resources :authors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "books#index"
end
