Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "callbacks"}

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  root to: 'application#home'
  resources :restaurants, only: [:index, :show]

  scope '/user' do
    root to: 'sessions#home', as: '/user_home'
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
