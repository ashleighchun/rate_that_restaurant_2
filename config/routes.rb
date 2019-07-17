Rails.application.routes.draw do
  resources :restaurants
  resources :reviews
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "callbacks"}

    devise_scope :user do
      get 'login', to: 'devise/sessions#new'
      get 'signup', to: 'devise/registrations#new'
    end

    root to: 'application#home'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
