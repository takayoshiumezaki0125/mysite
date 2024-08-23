DailyReportSystem::Application.routes.draw do


  match "blog_upload", to: "blog_upload#index", as: :blog_upload, via: :get
  match "blog_upload/subadmin", to: "blog_upload#index_for_subadmin", as: :blog_upload_sub, via: :get
  match "blog_upload/:id", to: "blog_upload#show", as: :show_blog_upload, via: :get
  match "blog_upload/:id/subadmin", to: "blog_upload#show_for_subadmin", as: :show_blog_upload_subadmin, via: :get
  match "blog_upload", to: "blog_upload#upload", as: :blog_upload_admin, via: :post
  match "blog_upload_subadmin", to: "blog_upload#upload_for_subadmin", as: :blog_upload_subadmin, via: :post

  match "posts/search", to: "posts#search", as: :posts_search, via: :get
  match "posts/posts_for_admin", to: "posts#posts_for_admin", as: :posts_for_admin, via: :get
  match "posts/shared", to: "posts#shared", as: :shared_posts, via: :get
  match "posts/destroy_post_comment/:id", to: "posts#destroy_post_comment", as: :destroy_post_comment, via: :delete
  match "posts/create_post_comment/:post_id", to: "posts#create_post_comment", as: :create_post_comment, via: :post
  match "posts/forward", to: "posts#forward", as: :forward, via: :post
  match "posts/destroy_forward", to: "posts#destroy_forward", as: :destroy_forward, via: :post
  get "help", to: "help#index"
  resources :posts

  match "users/edit_password/:id", to: "users#edit_password", as: :edit_password, via: :get
  match "users/change_password/:id", to: "users#change_password", as: :change_password, via: :put
  match "users/export", to: "users#export", as: :export, via: :get
  resources :users
  resources :groups

  root to: "main#index"

  match "login", to: "main#login", as: :main_login, via: :get
  match "login", to: "login#login", as: :login, via: :post
  match "logout", to: "login#logout", as: :logout, via: :get

  match "blog_config", to: "blog_config#index", as: :blog_config, via: :get
  match "blog_config/categories", to: "blog_config#create_category", as: :create_category, via: :post
  match "blog_config/categories/:id", to: "blog_config#destroy_category", as: :destroy_category, via: :delete
  match "blog_config/categories/:id", to: "blog_config#edit_category", as: :edit_category, via: :get
  match "blog_config/categories/:id", to: "blog_config#update_category", as: :update_category, via: :put
  match "blog_config/tags", to: "blog_config#create_tag", as: :create_tag, via: :post
  match "blog_config/tags/:id", to: "blog_config#destroy_tag", as: :destroy_tag, via: :delete
  match "blog_config/parent_categories", to: "blog_config#create_parent_category", as: :create_parent_category, via: :post
  match "blog_config/parent_categories/:id", to: "blog_config#destroy_parent_category", as: :destroy_parent_category, via: :delete
  match "blog_config/parent_categories/:id", to: "blog_config#edit_parent_category", as: :edit_parent_category, via: :get
  match "blog_config/parent_categories/:id", to: "blog_config#update_parent_category", as: :update_parent_category, via: :put
  match "blog_config/category_parent_categories", to: "blog_config#create_category_parent_category", as: :create_category_parent_category, via: :post

  match "report_config", to: "report_config#index", as: :report_config, via: :get
  match "report_config/add_receiver", to: "report_config#add_receiver", as: :add_receiver, via: :post
  match "report_config/destroy_receiver/:receiver_id", to: "report_config#destroy_receiver", as: :destroy_receiver, via: :delete

  match "blog/suggestions", to: "blog#suggestions", as: :suggestion_blog, via: :get
  match "blog/favorites", to: "blog#favorites", as: :favorite_blog, via: :get
  match "blog/search", to: "blog#search", as: :blog_search, via: :get
  match "blog/date", to: "blog#date", as: :blog_date, via: :get
  match "blog/user", to: "blog#user", as: :user_blog, via: :get
  match "blog/old_category", to: "blog#old_category", as: :blog_old_category, via: :get
  match "blog/category", to: "blog#category", as: :blog_category, via: :get
  match "blog/create_blog_comment/:id", to: "blog#create_blog_comment",  as: :create_blog_comment, via: :post
  match "blog/destroy_blog_comment/:id", to: "blog#destroy_blog_comment", as: :destroy_blog_comment, via: :delete
  match "blog", to: "blog#index", as: :blogs, via: :get
  match "blog/:id", to: "blog#show", as: :show_blog, via: :get


  match "posts/autosave", to: "posts#create", via: :post
  match "posts/:id/autosave", to: "posts#update", via: :patch

  match "data", to: "data#index", as: :data, via: :get
  match "data/graph", to: "data#graph", as: :graph, via: :get
  get 'user_activity', to: "data#user_activity", as: :user_activity
  post 'req_user_activity', to: 'data#req_user_activity', as: :req_user_activity
  resources :reports, only: [:index, :create, :show]
  match "reports", to: "reports#create", via: :post, as: "create_report"

  match "create_favorite", to: "favorites#create", as: :create_favorite, via: :post
  match "destroy_favorite", to: "favorites#destroy", as: :destroy_favorite, via: :delete

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', as: :purchase
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
  # root to: 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
