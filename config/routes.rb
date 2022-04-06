Rails.application.routes.draw do

  devise_for :customers, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: 'admin/homes#top'
    resources :genres, only: [:index, :edit, :update, :create]
    resources :items, only: [:edit, :update, :index, :new, :create, :show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    get 'sessions/new'
    get 'homes/top'
    patch '/admin/ordered_itmes/:id'=>'ordered_items#update'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
    resource :customer
    resources :deliveries, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    get '/orders/complete' => 'orders#complete', as: 'complete'
    post '/orders/confirm' => 'orders#confirm', as: 'confirm'
    resources :orders, only: [:new, :index, :show, :create]
    delete '/cart_items' => 'cart_items#destroy_all', as: 'destroy_all'
    get 'customer/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customer/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
end
  root to: 'public/homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
