Rails.application.routes.draw do

  resources :job_vacancies
  resources :applicants

# UNA RUTA PARA AUTOCOMPLETE y SERACH
  get '/search' => 'searches#search', as: :search
  get '/autocomplete/:query' => 'searches#autocomplete', as: :autocomplete


  get '/publications' => 'publications#index', as: :publications

  get    '/'         => 'users#home',     as: :home
  post   '/sign_up'  => 'users#sign_up',  as: :sign_up
  post   '/sign_in'  => 'users#sign_in',  as: :sign_in
  delete '/sign_out' => 'users#sign_out', as: :sign_out
  get    '/:name'    => 'users#profile',  as: :profile
  post '/upload_photo' => 'users#upload_photo', as: :upload_photo
  post '/upload_cover' => 'users#upload_cover', as: :upload_cover

  post   '/new_post' => 'posts#create',   as: :new_post

  post   '/follow'   => 'relationships#create', as: :follow
  delete '/unfollow' => 'relationships#destroy', as: :unfollow

  resources :resumes


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
