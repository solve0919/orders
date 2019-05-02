Rails.application.routes.draw do
  resources :requests
  resources :contractors
  resources :orders

  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
  root "home#top"
  resources :requests do
    member do
      get "count", to: "requests#count"
      post "count", to: "requests#count"
    end
  end
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
