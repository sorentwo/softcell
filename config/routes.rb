Softcell::Application.routes.draw do
  resource  :dashboard, only:   [:show]
  resources :clients,   except: [:index, :show]
  resources :invoices,  except: [:index] do
    member { get :print }
  end

  resources :sessions, only: [:new, :create, :destroy]

  get    'login'  => 'sessions#new', as: :login
  delete 'logout' => 'sessions#destroy', as: :logout

  root to: 'dashboards#show'
end
