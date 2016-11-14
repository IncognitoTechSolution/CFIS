Rails.application.routes.draw do
  resources :committee_notices
  resources :travels
  resources :form_types
  resources :filers
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :address_types
  resources :addresses
  resources :treasurers
  resources :candidates
  resources :committee_types
  resources :report_types
  resources :election_types
  resources :office_helds
  resources :office_soughts
  resources :filer_types
  resources :loans
  resources :credits
  resources :investment_purchases
  resources :coh_payments
  resources :expenditures
  resources :contributions
  resources :campaign_finance_infos
  resources :contribution_types
  resources :entity_types
  resources :prefixes
  resources :expend_types
  resources :expend_categories
  resources :payment_methods
  resources :states
  resources :myreports
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'report', to: 'welcome#report'
  get 'registration', to: 'welcome#registration'
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
