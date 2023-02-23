Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#show", page: "home"
  devise_for :users
  resources :users

  resources :events do
    resources  :attendances
  end

end
