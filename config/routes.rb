Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root "resumes#index"
  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  #
  get "login" => "users#login", as: 'login'
  get "signup" => "users#signup", as: 'signup'
  post "create_login_session" => "users#create_login_session"
  get "status" => "users#status", as: 'status'
  delete "logout" => "users#logout", as: 'logout'
  resources :users, only:[:create]

  get "setting" => "users#setting" , as: 'setting'
  post "bind_wechat" => "users#bind_wechat" , as: 'bind_wechat'

  get "get" => "accesses#get_passcode", as: 'get_passcode'

  resources :accesses do
    get "invalid" => "accesses#set_invalid"
    get "valid" => "accesses#set_valid"
  end

  resources :resumes

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
