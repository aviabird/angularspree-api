Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Ckeditor::Engine => '/ckeditor'
  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to
  # Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the
  # :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being
  # the default of "spree".
  mount Spree::Core::Engine, at: '/'

  # Main application routes

  scope '/api', module: 'api', defaults: { format: :json } do
    resources :taxonomies, only: :index
    get 'taxons/*permalink', to: 'taxons#show'
    resources :products, only: %i[index show]
    resource :cart do
      post :add_variant
      post :guest_login
      put :update_variant
      put :change_variant
      put :remove_adjustment
      delete :remove_variant
    end
    resources :credit_cards, only: :destroy
    resources :addresses, only: :destroy
    resources :countries, only: :index
    resources :orders, only: %i[index show]
  end

  scope module: 'api', path: 'auth', defaults: { format: :json } do
    get 'authenticated', to: 'accounts#authenticated'
    resources :accounts
    resources :passwords
  end

  scope module: 'api', path: 'address', defaults: {format: :json} do
    post 'shipment_availability', to: 'addresses#shipment_availability'
    resources :addresses
  end

  scope module: 'api', path: 'payubiz', defaults: {format: :json} do
    post 'handle_payment', to: 'payubiz#handle_payment'
    post 'canceled_payment', to: 'payubiz#canceled_payment'
    post 'post_request_payubiz', to: 'payubiz#post_request_payubiz'
    resources :payubiz
  end

  post 'auth/:provider', to: 'oauth#create'

  namespace :spree do
    get 'user_favorite_products', to: 'favorite_products#user_favorite_products', as: 'user_favorite_products'
  end
end
