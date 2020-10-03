Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  "items#index"

  #商品詳細ページ
  get    '/items/:id',   to:  'items#show'

   
  resources :items do
   resources :orders 
  end

  resources :items do
    resource :bookmarks, only: [:create, :destroy,:show]
  end

 
end
