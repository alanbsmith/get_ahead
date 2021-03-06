Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root "pages#home"

  resources :ratings, only: [:index, :new, :create]
  resources :reviews, only: [:create]
  resources :notifications, only: [:new, :create]
  resources :programs, only: [:index, :show] do
    collection do
      get :claim_your
    end
  end

  resources :favorites, except: [:new, :destroy] do
    member do
      post :add_program
      post :remove_program
    end
  end

  namespace :admin do
    resources :programs, only: [:index, :edit, :update, :destroy]
  end

  resources :pages, only: [:home] do
    collection do
      get :map
    end
  end

  match 'auth/:provider/callback', to: 'sessions#create', via: "get"
  match 'auth/failure', to: redirect('/'),   via: "get"
  match 'signout', to: 'sessions#destroy', via: "get"

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
