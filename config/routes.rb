Rails.application.routes.draw do

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

  # top page
  root 'homes#top'
  get 'homes/about'
  get 'homes/size'
  get 'homes/ship_pay'

  # ec page
  resources :items, only: [:index, :show] do
    resources :likes, only: [:create, :destroy]
  end
  resources :genres, only: [:show]
  delete 'cart_item/destroy_all', to: 'cart_items#destroy_all'
  resources :cart_items, only: [:index, :create, :update, :destroy]
  get 'orders/input_address', to: 'orders#input_address'
  post 'orders/create_address', to: 'orders#create_address'
  post 'orders/create_session', to: 'orders#create_session'
  get 'orders/display', to: 'orders#display'
  get 'orders/thanks', to: 'orders#thanks'
  resources :orders, only: [:index, :show, :create]
  
  # end_user mypage
  resources :end_users, only: [:show, :edit, :update, :destroy] do
    resources :likes, only: [:index]
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
    patch 'orders/:id/production', to: 'orders#production_update', as: 'order_production'
    resources :orders, only: [:index, :show, :update]
    resources :end_users, only: [:index]
  end
  
  # shipping address
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
