Prash::Application.routes.draw do
  resources :product_descriptions


  resources :product_types


  get "store/search"

  get "stores/search"

  devise_for :users, :path => '', :path_names => {:sign_in => '/admin/sign_in'}
  resources :orders do
    collection do
      post 'post_back'
    end
  end
  resources :terms
  resources :location_types

  resources :cities do
    collection do
      get 'load_city'
    end
  end

  resources :states do
    collection do
      get 'load_state'
    end
  end
  resources :countries
  resources :locations
  resources :areas do
    collection do
      get 'load_area'
    end
  end

  resources :stores do
    collection do
      get 'search'
    end
  end

# The priority is based upon orders of creation:
# first created -> highest priority.

# Sample of regular route:
#   match 'products/:id' => 'catalog#view'
# Keep in mind you can assign values other than :controller and :action

# Sample of named route:
#   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
# This route can be invoked with purchase_url(:id => product.id)

# Sample resource route (maps HTTP verbs to controller actions automatically):
#   resources :products

# Sample resource route with options:
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

# Sample resource route with sub-resources:
#   resources :products do
#     resources :comments, :sales
#     resource :seller
#   end

# Sample resource route with more complex sub-resources
#   resources :products do
#     resources :comments
#     resources :sales do
#       get 'recent', :on => :collection
#     end
#   end

# Sample resource route within a namespace:
#   namespace :admin do
#     # Directs /admin/products/* to Admin::ProductsController
#     # (app/controllers/admin/products_controller.rb)
#     resources :products
#   end

# You can have the root of your site routed with "root"
# just remember to delete public/index.html.
  root :to => 'welcome#index'

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end

