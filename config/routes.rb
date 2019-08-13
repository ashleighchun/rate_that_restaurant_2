Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "callbacks"}

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end


  root to: 'application#home'

  resources :restaurants do #same thing as writing out get 'restaurants/:id' => "restaurants#show" for each route
    resources :reviews, only: [:new, :create, :index] #review belongs to restaurant, you want to nest url
  end

  resources :users, only: [:show]

  resources :reviews
  
end
