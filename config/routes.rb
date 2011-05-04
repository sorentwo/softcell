Softcell::Application.routes.draw do
  resource  :dashboard, only: :show
  resources :clients,  :except => [:index, :show]
  resources :invoices, :except => [:index] do
    member { get :print }
  end

  # Authentiation
  resources :sessions, only: [:new, :create, :destroy]

  match 'login'  => 'sessions#new', as: :login
  match 'logout' => 'sessions#destroy', as: :logout

  root :to => 'dashboards#show'
end
