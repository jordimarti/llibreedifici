Rails.application.routes.draw do
  
  
  
  
  resources :importats
  resources :element_predefinits
  resources :operacions
  resources :sistemes
  get 'edificis/llistat_edificis', to: 'edificis#llistat_edificis', :as => :llistat_edificis
  get 'edificis/:id/amagar', to: 'edificis#amagar', :as => :amagar
  get 'edificis/:id/duplicate', to: 'edificis#duplicate', :as => :duplicate
  get 'edificis/:edifici_id/agents', to: 'agents#index', :as => :agents
  get 'edificis/:edifici_id/dades', to: 'dades#index', :as => :dades
  get 'edificis/:edifici_id/documents', to: 'documents#index', :as => :documents
  get 'edificis/:edifici_id/documents/llibre_nou_pdf', to: 'documents#llibre_nou_pdf', :as => :llibre_nou_pdf
  get 'edificis/:edifici_id/documents/manual_habitatge_pdf', to: 'documents#manual_habitatge_pdf', :as => :manual_habitatge_pdf
  get 'edificis/:edifici_id/documents/llibre_existent_pdf', to: 'documents#llibre_existent_pdf', :as => :llibre_existent_pdf
  get 'edificis/:edifici_id/documents/nou(.:format)', to: 'documents#nou', :as => :nou
  get 'edificis/:edifici_id/documents/llibre_nou(.:format)', to: 'documents#llibre_nou', :as => :llibre_nou
  get 'edificis/:edifici_id/documents/calendari_manteniment(.:format)', to: 'documents#calendari_manteniment', :as => :calendari_manteniment
  get 'edificis/:edifici_id/documents/manual_habitatge(.:format)', to: 'documents#manual_habitatge', :as => :manual_habitatge
  get 'edificis/:edifici_id/documents/llibre_existent(.:format)', to: 'documents#llibre_existent', :as => :llibre_existent
  get 'edificis/:edifici_id/documents/vista_pdf_edifici_nou', to: 'documents#vista_pdf_edifici_nou', :as => :vista_pdf_edifici_nou
  get 'edificis/:edifici_id/documents/vista_pdf_edifici_nou_es', to: 'documents#vista_pdf_edifici_nou_es', :as => :vista_pdf_edifici_nou_es
  get 'edificis/:edifici_id/documents/vista_pdf_manual_habitatge', to: 'documents#vista_pdf_manual_habitatge', :as => :vista_pdf_manual_habitatge
  get 'edificis/:edifici_id/documents/vista_pdf_manual_habitatge_es', to: 'documents#vista_pdf_manual_habitatge_es', :as => :vista_pdf_manual_habitatge_es
  get 'edificis/:edifici_id/documents/vista_pdf_edifici_existent', to: 'documents#vista_pdf_edifici_existent', :as => :vista_pdf_edifici_existent
  get 'edificis/:edifici_id/documents/vista_pdf_edifici_existent_es', to: 'documents#vista_pdf_edifici_existent_es', :as => :vista_pdf_edifici_existent_es
  get 'edificis/:edifici_id/documents/vista_pdf_header', to: 'documents#vista_pdf_header', :as => :vista_pdf_header
  get 'edificis/:edifici_id/documents/vista_pdf_footer', to: 'documents#vista_pdf_footer', :as => :vista_pdf_footer

  get 'edificis/:edifici_id/documents/exporta_xml', to: 'documents#exporta_xml', :as => :exporta_xml

  get 'edificis/:edifici_id/sistemes/afegir_sistema', to: 'sistemes#afegir_sistema', :as => :afegir_sistema
  get 'edificis/:edifici_id/referencies/crear_llistat', to: 'referencies#crear_llistat', :as => :crear_llistat
  get 'edificis/:edifici_id/referencies/calendari', to: 'referencies#calendari', :as => :calendari
  #get 'edificis/:edifici_id/info_usuaris/validate_user_nif', to: 'info_usuaris#validate_user_nif', :as => :validate_user_nif
  #get 'edificis/:edifici_id/info_usuaris/new_personal', to: 'info_usuaris#new_personal', :as => :new_personal

  get 'edificis/:edifici_id/pagaments/validar_dades', to: 'pagaments#validar_dades', :as => :validar_dades 
  get 'pagaments/update_pagament', to: 'pagaments#update_pagament', :as => :update_pagament
  get 'edificis/:edifici_id/crear_pagament', to: 'pagaments#crear_pagament', :as => :crear_pagament 
  # 'edificis/:edifici_id/send_request', to: 'pagaments#send_request', :as => :send_request 
  get 'edificis/:edifici_id/pagaments/error_factura', to: 'pagaments#error_factura', :as => :error_factura 
  get 'edificis/:edifici_id/pagaments/error_pagament', to: 'pagaments#error_pagament', :as => :error_pagament 
  get 'edificis/:edifici_id/usuari_factures/mostra_dades', to: 'usuari_factures#mostra_dades', :as => :mostra_dades
  
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
    resources :particions
    resources :sanejaments
    resources :aigues
    resources :climatitzacions
    resources :electricitats
    resources :gas
    resources :ventilacions
    resources :incendis
    resources :ascensors
    resources :especials
    resources :telecomunicacions
    resources :elements
    resources :checklist_nou_plurifamiliars
    resources :checklist_nou_unifamiliars
    resources :checklist_existent_plurifamiliars
    resources :checklist_nou_terciaris
    resources :entitats
    resources :carregues
    resources :regim_especials
    resources :regim_propietats
    resources :declaracions
    resources :llicencies
    resources :garantia_instalacions
    resources :garantia_promotors
    resources :coordinadors
    resources :colaboradors
    resources :garantia_constructors
    resources :energia_certificats
    resources :referencia_calendaris
    resources :aptitud_certificats
    resources :iites
    resources :info_usuaris
    resources :pagaments
    resources :empresa_factures
    resources :usuari_factures
    resources :signatura_llibres
    resources :signatura_instruccions
    resources :signatura_promotors
    resources :inscripcio_registrals
  end
  
  
  devise_for :users
  
  
  get 'pagaments/llistat_pagaments'
  get 'pagaments/detall_pagament'
  get 'pagaments/cambra_projects'
  
  
  
  
  get 'home/index'
  get 'home/tutorial'
  get 'home/permisos'
  get 'home/contacta'
  get 'home/avis'
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
