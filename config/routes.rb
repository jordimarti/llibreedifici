Rails.application.routes.draw do
  
  
  
  
  
  
  
  
  
  resources :operacions
  get 'edificis/:edifici_id/agents', to: 'agents#index', :as => :agents
  get 'edificis/:edifici_id/documents', to: 'documents#index', :as => :documents
  get 'edificis/:edifici_id/documents/quadern(.:format)', to: 'documents#quadern', :as => :quadern
  get 'edificis/:edifici_id/documents/nou_plurifamiliar(.:format)', to: 'documents#nou_plurifamiliar', :as => :nou_plurifamiliar
  #get 'edificis/:edifici_id/sistemes', to: 'sistemes#index', :as => :sistemes

  get 'edificis/:edifici_id/sistemes/afegir_sistema', to: 'sistemes#afegir_sistema', :as => :afegir_sistema
  get 'edificis/:edifici_id/referencies/crear_llistat', to: 'referencies#crear_llistat', :as => :crear_llistat
  resources :sistemes
  resources :edificis do
    resources :identificacions
    resources :promotors
    resources :projectistes
    resources :constructors
    resources :directors
    resources :execucio_directors
    resources :laboratoris
    resources :sistemes
    resources :referencies
    resources :entitat_controls
    resources :subministradors
    resources :industrials
    resources :fonamentacions
    resources :estructures
    resources :tancaments_verticals
    resources :cobertes
  end
  
  #get 'checklist_edifici_nou_plurifamiliars/quadern'
  #get 'checklist_edifici_nous/det'
  #get 'checklist_edifici_nous/manuals'
  #get 'checklist_edifici_nous/arxiu'
  
  
  devise_for :users
  
  
  
  
  
  
  
  get 'home/index'
  get 'home/tutorial'
  root :to => "home#index"
  
  match ':controller(/:action(/:id))', :via => [:get, :post]
  

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
  #     #     resources :sales do
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
