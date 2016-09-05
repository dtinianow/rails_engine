Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'merchants/find', to: 'merchants#find'
      get 'merchants/find_all', to: 'merchants#find_all'
      get 'merchants/random', to: 'merchants#random'
      get 'merchants/most_revenue', to: 'merchants#most_revenue'
      resources :merchants, only: [:index, :show]

      get 'invoices/find', to: 'invoices#find'
      get 'invoices/find_all', to: 'invoices#find_all'
      get 'invoices/random', to: 'invoices#random'
      resources :invoices, only: [:index, :show]

      get 'items/find', to: 'items#find'
      get 'items/find_all', to: 'items#find_all'
      get 'items/random', to: 'items#random'
      resources :items, only: [:index, :show]
    end
  end
end
