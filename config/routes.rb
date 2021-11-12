Rails.application.routes.draw do
  
  scope module: 'public' do
    root to: 'homes#top'
    get  "/home/about" => "homes#about"
    resource :items, only: [:show, :index]
  end
  
  scope mobule: :public do
    resource :genres, only: [:show]
    resource :customer, only: [:update, :edit, :show]
    get 'unsubscribe' => 'customers#unsubscribe'
    patch 'withdraw' => 'customers#withdraw', as: 'customers_withdraw'
    resource :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items' => 'cart_items#all_destroy', as: 'all_destroy'
    get 'orders/about' => 'orders#about', as: 'orders_about'
    get 'orders/thanks' => 'orders#thanks'
    resource :orders, only: [:new, :create, :index, :show]
    resource :addresses, oly: [:index, :edit, :create, :destoroy, :update]
  end
  
  namespace :admin do
    root to: 'homes#top'
    resource :customers, only[:index, :edit, :update, :shpw]
    resource :genres, only[:index, :create, :edit, :update]
    resource :items, only[:index, :new, :create, :show, :edit, :update]
    resource :orders, only[:show, :update, :index]
    resource :order_details, onry[:update]
  end
  #会員側
  devise_for :customers, controller:{
    sessions:   'public/sessions',
    password:   'public/password',
    registrations: 'public/registrations'
  }
  
  #管理者側
  devise_for :admins, controller:{
    sessions:   'admin/sessions',
    password:   'admin/password',
    registrations: 'admin/registrations'
  }
  
end
