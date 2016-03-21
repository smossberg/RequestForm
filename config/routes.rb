Rails.application.routes.draw do


resources :actors

resources :owners
  #get 'business_contexts/show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
#root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
resources :requests do
	member do
		patch 'add_actors', :action => :add_actors_to_request 
		post 'add_owner', :action => :add_ownership, :controller => :owners
	end
	resource :business_context 
	resources :actors do
		delete 'unlink',:on => :member,:controller => :requests, :action => :remove_actor_from_request 
	end
	resources :flows
	resources :owners
end
resources :business_context do 
	resources :headings, only: [:new,  :edit, :show, :create, :destroy] do
		resources :uploads, only: [:new, :index]
	end
end
resources :headings, only: [:update] do
	resources :uploads
end
root 'requests#index'
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
