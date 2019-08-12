Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "callbacks"}

  root to: 'application#home'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end



  resources :restaurants do #same thing as writing out get 'restaurants/:id' => "restaurants#show" for each route
    resources :reviews, only: [:new, :create, :index] #review belongs to restaurant, you want to nest url
  end

  resources :users, only: [:show]

  scope '/user' do  #get rid of nesting under user
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
