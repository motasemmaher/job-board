Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "health", to: "healths#check"
  # path started -> api/v1
  namespace :api do
    namespace :v1 do
      resources :jobs
      resources :applications
      resources :users
      post "users/login", to: "users#login"
    end
  end
end
