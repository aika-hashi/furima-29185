Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
   
  resources :items do
   resources :orders 
  end
  # /items/2/orders
  # /items/4/orders/5
  # /items/4/orders/4/edit
  # /items/4/orders/new
end
