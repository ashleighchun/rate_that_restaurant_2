Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "callbacks"}

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  root to: 'users#home'
  resources :users
  resources :restaurants
  resources :reviews


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
