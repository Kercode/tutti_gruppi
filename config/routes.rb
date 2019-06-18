Rails.application.routes.draw do
  devise_for :authentications, controllers: { registrations: 'authentications/registrations', confirmations: 'authentications/confirmations'}
  get 'home/index'
  get 'home/private'
  get 'orders/new', to: 'orders#new'

  namespace :admin do
    get 'dashboard', to: 'dashboard#home'
    get 'liste-des-membres', to: 'dashboard#index'
    get 'show/:id', to: 'dashboard#show'
  end
  root 'home#index'

  resources :orders, only:[:index, :show, :create, :new]
  resources :authentications, only:[:index, :show, :create, :new, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
