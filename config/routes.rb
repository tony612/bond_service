BondService::Application.routes.draw do
  resources :customers do
    collection do
      get "upload"
      post "import"
      get "categories"
      post "categories", :to => "customers#create_category"
      get "new_category"
      get "categories/:category_id/edit", :to => "customers#edit_category"
      get "categories/:category_id", :to => "customers#show_category"
      put "categories/:category_id", :to => "customers#update_category"
      delete "categories/:category_id", :to => "customers#destroy_category"
    end
  end
  resources :plans do
    member do
      get "publish"
    end
    collection do
      get "upload"
      post "import"
    end
  end
  get "dashboard/index"
  post "users", :to => "users#create"
  get "users/modify", :to => "users#modify"
  devise_for :users
  resources :users do
    collection do
      get "upload"
      post "import"
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: "dashboard#index"

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
