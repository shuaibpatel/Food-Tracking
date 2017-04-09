Rails.application.routes.draw do
  
  resources :donations
  get 'donation/index'
  resources :reviews
  get 'homevd/index'

  get 'home/index'

  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  get 'products/index'

#Vinayak
  get 'payments/searchingName'

  post 'validate3',  :controller=>'payments', :action=>'results' 

  resources :foods

  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
 # root to: "homevd#index"





  #Vinayak
resources :payments, only: [:index, :new, :create]
#Vinayak
  get 'payments/index'

  get 'payments/new'

  get 'payments/create'

#shuaib
  resources :needs
  resources :customersps do
      resources :foodsps
end

get '/fat' =>'fatintake#checkFatIntakeSP'
post '/validate1' =>'fatintake#isFatCal'


  resources :shakes
  resources :profiles
  resources :analytics
  resources :customers
  get 'home2/index'

  get 'home1/index'

  get 'home1/about'
  
  get '/graphs' =>'analytics#graphs'
  
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'
  
  
  get '/proteinC' =>'analytics#proteinCalc'
  
  
  #validate that a number is even
  post '/validate', :controller=>'analytics', :action=>'proteinCounter'

  get 'home1/contactUs'

  get 'home1/findUs'

  devise_for :users

  root :to => 'home1#index'
  
  get 'home/index'
  

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