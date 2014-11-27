Rails.application.routes.draw do

	root "pages#index"
  
  devise_for :customer

	resources :register, :pages
	resources :preferences, :controller => "register", :path => "register"  # For the helper tag to recognize preferences_path
	resources :customers, :controller => "register", :path => "register#registerCustomer"
  resource :sessions, :only => [:new, :create, :destroy]
  resources :authentications
  get 'auth/:provider/callback' => 'authentications#create'

	match 'registerCustomer' => 'register#registerCustomer', :as =>'registerCustomer', :via => [:post]
  match 'get_started' => 'pages#get_started', :as =>'get_started', :via => [:get]


  get '/about' => 'pages#about'
  get '/home' => 'pages#index'
  get '/login' => "sessions#new", :as => "login"
  get '/logout' => "sessions#destroy", :as => "logout"
  get '/news'=> "customer#news"
  get '/profile' => "customer#profile"
  get '/settings' => "customer#settings"
  get '/messages' => "customer#messages"
  get '/post' => "stylists#post"
  get '/index2' => "index2#index2"

    #    get '/contact' => 'pages#contact'
	#get '/login' => 'pages#login'
   #get '/get_started' => 'register#index'
	#get '/register' => 'pages#get_started'
  #get '/register/show' => 'register#show'
	#get 'pages#get_started' => 'register#index'


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
