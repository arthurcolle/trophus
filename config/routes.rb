Rails.application.routes.draw do
  devise_for :users
  get 'home' => 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  authenticated :user do
    root :to => "pages#primary", as: :authenticated_root
  end
  root :to => "pages#primary"

  get 'users/:id/show' => 'users#show'
  
  resources :dishes
  resources :conversations, only: [:index, :show, :destroy]
  resources :messages, only: [:new, :create]

  get 'inbox' => 'users#inbox'
  get 'get_user_notif_count' => 'users#get_notif_count'
  
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :restore
    end
  end
  
  resources :conversations, only: [:index, :show, :destroy] do
    collection do
      delete :empty_trash
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :mark_as_read
    end
  end
  post 'store_temporary_user_location' => 'users#temp_location'

  post 'create_multiple' => 'dishes#multicreate'
  get 'multicreate' => 'dishes#multicreate', as: 'multicreate_url'
  post 'delete_unfinished' => 'dishes#delete_unfinished'

  get '/charges/new' => 'charges#new'
  post '/charges/create' => 'charges#create'
  
  match '/users/:id/edit_latlong', to: 'users#edit_latlong', via: 'post'
  match '/users/:id/jsonify', to: 'users#jsonify', via: 'get'
  match '/users/get_ids', to: 'users#get_ids', via: 'get'
  get '/users/:id/dishes' => 'users#dishes'
  match '/oauth/connect', to: 'oauth#connect', via: 'get'
  match '/users/auth/instagram/callbacks', to: 'oauth#auth', via: 'get'

  get '/careers' => 'pages#careers'
  get '/primary' => 'pages#primary'
  get '/map' => 'pages#map'
  get '/map2' => 'pages#map2'
  get '/connect' => 'users#connect'
  post '/accepted_tos' => 'users#accepted_tos'
  post '/create_connected' => 'users#create_connected'

  get "/user_recent_media" => 'users#user_recent_media'
  get "/user_recent_media_single" => 'users#user_recent_media_single'
  get "/user_recent_media_single_prof" => 'users#user_recent_media_single_prof'
  post '/prof_pic_change' => 'users#prof_pic_change'

  post '/autocomplete' => 'search#search'

  get '/how-it-works' => 'pages#how_it_works'
  get '/getting-started' => 'pages#getting_started'

  # Stripe Connect endpoints
  #  - oauth flow
  get '/connect/confirm' => 'stripe#confirm', as: 'stripe_confirm'
  get '/connect/deauthorize' => 'stripe#deauthorize', as: 'stripe_deauthorize'
  #  - create accounts
  post '/connect/managed' => 'stripe#managed', as: 'stripe_managed'

  # Stripe webhooks
  post '/hooks/stripe' => 'hooks#stripe'

  post 'dishes/:id/order' => 'dishes#order', :as => "order_dish"

  get 'auth/facebook', as: "auth_provider"
  get 'cb', to: 'users#login'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
