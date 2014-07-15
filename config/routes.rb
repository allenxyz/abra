Rails.application.routes.draw do
  devise_for :users
  
  root "how_tos#index"


  get '/profile' => "users#profile"
  get '/admin_panel/users' => 'users#admin_edit_user'
  get '/admin_panel/howtos' => 'users#admin_edit_howto'

  get '/how_to/new' => "how_tos#new"
  put '/how_to/create' => "how_tos#create"
  delete '/how_to/delete/:how_to_id' => "how_tos#delete"
  get '/show/:how_to_id' => "how_tos#show"
  get '/random' => 'how_tos#random'
  

  put '/like/:how_to_id' => 'likes#like'
  delete '/unlike/:how_to_id' => 'likes#unlike'
  get '/like/:how_to_id/index' => 'likes#index'

  get '/steps/new' => "steps#new"
  put '/steps/create' => "steps#create"

  put '/comment/create' => 'comments#create'
  delete 'comment/delete/:id' => 'comment#delete'

  get '/attempt/new' => 'attempts#new'
  put '/attempt/create' => 'attempts#create'

  get '/user/edit' => 'users#edit'
  post '/user/update' => 'users#update'
  post '/user/:id/promote' => 'users#promote'
  post '/user/:id/demote' => 'users#demote'
  delete '/user/:id/delete' => "users#destroy"
  get '/user/:id/show' => 'users#show'

  put '/rating/:user_id/:how_to_id/' => 'how_tos#new_rating'



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
