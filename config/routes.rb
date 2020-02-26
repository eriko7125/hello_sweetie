Rails.application.routes.draw do

  get 'orders/index'
  get 'orders/show'
  get 'cart_items/input'
  get 'cart_items/display'
  get 'cart_items/thanks'
  
  # top page
  root 'homes#top'
  get 'homes/about'

  # ec page
  resources :items, only: [:index, :show, :create]
  resources :genres, only: [:show]
  resources :orders, only: [:index, :show, :create]
  resources :cart_items, only: [:index, :create, :update, :destroy]

  #admin_users devise & end_users devise
  devise_for :admin_users, controllers: {
    sessions:      'admin_users/sessions',
    passwords:     'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }
  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }

  # end_user page
  resources :end_users, only: [:show, :edit, :update, :destroy] do
    collection do
      get :confirm
    end
  end

  # admin page
  namespace :admin do
    resources :items, only: [:index, :show, :new, :edit, :create, :update]
    resources :genres, only: [:index, :edit, :update, :create]
    resources :materials, only: [:index, :edit, :update, :create]
    resources :ribbons, only: [:index, :edit, :update, :create]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
    resources :end_users, only: [:index]
  end

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
