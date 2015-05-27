Rails.application.routes.draw do
  devise_for :users
  get 'home' => 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  root to: 'pages#home'


  resources :dishes
  get '/charges/new' => 'charges#new'
  post '/charges/create' => 'charges#create'

  #post 'users#edit_latlong' => 'users#edit_latlong'
  match '/users/:id/edit_latlong', to: 'users#edit_latlong', via: 'post'
  match '/users/:id/jsonify', to: 'users#jsonify', via: 'get'
  match '/users/get_ids', to: 'users#get_ids', via: 'get'
  get '/users/:id/dishes' => 'users#dishes'
  match '/oauth/connect', to: 'oauth#connect', via: 'get'
  match '/users/auth/instagram/callbacks', to: 'oauth#auth', via: 'get'

  get "/user_recent_media" => 'users#user_recent_media'
  get "/user_recent_media_single" => 'users#user_recent_media_single'


  post 'dishes/:id/order' => 'dishes#order', :as => "order_dish"
  
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
