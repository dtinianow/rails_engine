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
      get 'merchants/:id/favorite_customer', to: 'merchants/customers#show'
      get 'merchants/:id/items',             to: 'merchants/items#index'
      get 'merchants/:id/invoices',          to: 'merchants/invoices#index'
      get 'merchants/:id/customers_with_pending_invoices', to: 'merchants/pending_invoices#index'
      resources :merchants, only: [:index, :show]

      get 'invoices/find_all',          to: 'invoices/find#index'
      get 'invoices/find',              to: 'invoices/find#show'
      get 'invoices/random',            to: 'invoices/random#show'
      get 'invoices/:id/transactions',  to: 'invoices/transactions#index'
      get 'invoices/:id/invoice_items', to: 'invoices/invoice_items#index'
      get 'invoices/:id/items',         to: 'invoices/items#index'
      get 'invoices/:id/customer',      to: 'invoices/customers#show'
      get 'invoices/:id/merchant',      to: 'invoices/merchants#show'
      resources :invoices, only: [:index, :show]

      get 'items/find_all',          to: 'items/find#index'
      get 'items/find',              to: 'items/find#show'
      get 'items/random',            to: 'items/random#show'
      get 'items/:id/invoice_items', to: 'items/invoice_items#index'
      get 'items/:id/merchant',      to: 'items/merchants#show'
      get 'items/most_revenue',      to: 'items/best_sellers_by_revenue#index'
      get 'items/most_items',        to: 'items/best_sellers_by_items#index'
      resources :items, only: [:index, :show]

      get 'invoice_items/find_all',    to: 'invoice_items/find#index'
      get 'invoice_items/find',        to: 'invoice_items/find#show'
      get 'invoice_items/random',      to: 'invoice_items/random#show'
      get 'invoice_items/:id/invoice', to: 'invoice_items/invoices#show'
      get 'invoice_items/:id/item',    to: 'invoice_items/items#show'
      resources :invoice_items, only: [:index, :show]

      get 'customers/find_all',              to: 'customers/find#index'
      get 'customers/find',                  to: 'customers/find#show'
      get 'customers/random',                to: 'customers/random#show'
      get 'customers/:id/invoices',          to: 'customers/invoices#index'
      get 'customers/:id/transactions',      to: 'customers/transactions#index'
      get 'customers/:id/favorite_merchant', to: 'customers/merchants#show'
      resources :customers, only: [:index, :show]

      get 'transactions/find_all',    to: 'transactions/find#index'
      get 'transactions/find',        to: 'transactions/find#show'
      get 'transactions/random',      to: 'transactions/random#show'
      get 'transactions/:id/invoice', to: 'transactions/invoices#show'
      resources :transactions, only: [:index, :show]
    end
  end
end
