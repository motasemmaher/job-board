Rails.application.routes.draw do
  resources :stories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # jobs API's
  get "health", to: "healths#check"
  namespace :api do
    namespace :v1 do
      resources :jobs
    end
  end

  put "health", to: "healths#check"
  namespace :api do
    namespace :v1 do
      resources :jobs, method: :edit
    end
  end

  post "health", to: "healths#check"
  namespace :api do
    namespace :v1 do
      resources :jobs, method: :create
    end
  end

  delete "health", to: "healths#check"
  namespace :api do
    namespace :v1 do
      resources :jobs, method: :destroy
    end
  end

  # users API's
  get "health", to: "healths#check"
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

  post "health", to: "healths#check"
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create]
    end
  end

  post "api/v1/users/login", to: "api/v1/users#login"
  namespace :api do
    namespace :v1 do
      resources :users, method: :login
    end
  end

  # applications API's
  get "health", to: "healths#check"
  namespace :api do
    namespace :v1 do
      resources :applications
    end
  end

  post "health", to: "healths#check"
  namespace :api do
    namespace :v1 do
      resources :applications, only: %i[create]
    end
  end
end
