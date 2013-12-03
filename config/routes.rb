Likestatus::Application.routes.draw do
  resources :products


  get "dashboard/index"

  authenticated :user do
    root :to => 'dashboard#index'
  end


  root :to => "home#index"
  devise_for :users
  resources :users
  post 'status_update' => "users#status_update"
  match 'status_like/:id' => "users#status_like", :as => "status_like"
  get 'unlike_status/:id' => "users#unlike_status", :as => "unlike_status"

  get 'collection/:id' => "collection#show", :as => :product_collection
end