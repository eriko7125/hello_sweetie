Rails.application.routes.draw do
  namespace :admins do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :admins do
    get 'items/index'
    get 'items/edit'
    get 'items/new'
    get 'items/show'
  end
  namespace :admins do
    get 'materials/index'
    get 'materials/edit'
  end
  namespace :admins do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admins do
    get 'end_users/index'
  end
  get 'orders/index'
  get 'orders/show'
  get 'end_users/show'
  get 'end_users/confirm'
  get 'end_users/edit'
  get 'addresses/index'
  get 'addresses/edit'
  get 'cart_items/index'
  get 'cart_items/input'
  get 'cart_items/display'
  get 'cart_items/thanks'
  get 'genres/index'
  get 'items/index'
  get 'items/show'
  get 'homes/top'
  get 'homes/about'
  devise_for :admin_users
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
