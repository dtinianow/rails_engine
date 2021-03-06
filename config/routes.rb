Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      namespace :merchants do
        get 'find_all',              to: 'find#index'
        get 'find',                  to: 'find#show'
        get 'random',                to: 'random#show'
        get 'most_revenue',          to: 'best_sellers_by_revenue#index'
        get 'revenue',               to: 'revenue#index'
        get ':id/revenue',           to: 'revenue#show'
        get 'most_items',            to: 'best_sellers_by_items#index'
        get ':id/favorite_customer', to: 'customers#show'
        get ':id/items',             to: 'items#index'
        get ':id/invoices',          to: 'invoices#index'
        get ':id/customers_with_pending_invoices', to: 'pending_invoices#index'
      end

      namespace :invoices do
        get 'find_all',          to: 'find#index'
        get 'find',              to: 'find#show'
        get 'random',            to: 'random#show'
        get ':id/transactions',  to: 'transactions#index'
        get ':id/invoice_items', to: 'invoice_items#index'
        get ':id/items',         to: 'items#index'
        get ':id/customer',      to: 'customers#show'
        get ':id/merchant',      to: 'merchants#show'
      end

      namespace :items do
        get 'find_all',          to: 'find#index'
        get 'find',              to: 'find#show'
        get 'random',            to: 'random#show'
        get ':id/invoice_items', to: 'invoice_items#index'
        get ':id/merchant',      to: 'merchants#show'
        get 'most_revenue',      to: 'best_sellers_by_revenue#index'
        get 'most_items',        to: 'best_sellers_by_items#index'
        get ':id/best_day',      to: 'best_day#show'
      end

      namespace :invoice_items do
        get 'find_all',    to: 'find#index'
        get 'find',        to: 'find#show'
        get 'random',      to: 'random#show'
        get ':id/invoice', to: 'invoices#show'
        get ':id/item',    to: 'items#show'
      end

      namespace :customers do
        get 'find_all',              to: 'find#index'
        get 'find',                  to: 'find#show'
        get 'random',                to: 'random#show'
        get ':id/invoices',          to: 'invoices#index'
        get ':id/transactions',      to: 'transactions#index'
        get ':id/favorite_merchant', to: 'merchants#show'
      end

      namespace :transactions do
        get 'find_all',    to: 'find#index'
        get 'find',        to: 'find#show'
        get 'random',      to: 'random#show'
        get ':id/invoice', to: 'invoices#show'
      end

      resources :merchants, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
