Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'merchants/find_all',              to: 'merchants/find#index'
      get 'merchants/find',                  to: 'merchants/find#show'
      get 'merchants/random',                to: 'merchants/random#show'
      get 'merchants/most_revenue',          to: 'merchants/best_sellers_by_revenue#index'
      get 'merchants/revenue',               to: 'merchants/revenue#index'
      get 'merchants/:id/revenue',           to: 'merchants/revenue#show'
      get 'merchants/most_items',            to: 'merchants/best_sellers_by_items#index'
      get 'merchants/:id/favorite_customer', to: 'merchants/favorite_customers#show'
      get 'merchants/:id/items',             to: 'merchants/items#index'
      get 'merchants/:id/invoices',          to: 'merchants/invoices#index'
      resources :merchants, only: [:index, :show]

      get 'invoices/find_all', to: 'invoices/find#index'
      get 'invoices/find',     to: 'invoices/find#show'
      get 'invoices/random',   to: 'invoices/random#show'
      resources :invoices, only: [:index, :show]

      get 'items/find_all', to: 'items/find#index'
      get 'items/find',     to: 'items/find#show'
      get 'items/random',   to: 'items/random#show'
      resources :items, only: [:index, :show]

      get 'invoice_items/find_all', to: 'invoice_items/find#index'
      get 'invoice_items/find',     to: 'invoice_items/find#show'
      get 'invoice_items/random',   to: 'invoice_items/random#show'
      resources :invoice_items, only: [:index, :show]

      get 'customers/find_all',         to: 'customers/find#index'
      get 'customers/find',             to: 'customers/find#show'
      get 'customers/random',           to: 'customers/random#show'
      get 'customers/:id/invoices',     to: 'customers/invoices#index'
      get 'customers/:id/transactions', to: 'customers/transactions#index'
      resources :customers, only: [:index, :show]

      get 'transactions/find_all',    to: 'transactions/find#index'
      get 'transactions/find',        to: 'transactions/find#show'
      get 'transactions/random',      to: 'transactions/random#show'
      get 'transactions/:id/invoice', to: 'transactions/invoices#show'
      resources :transactions, only: [:index, :show]
    end
  end
end
