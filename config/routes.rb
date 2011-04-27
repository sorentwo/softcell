Softcell::Application.routes.draw do
  resource  :dashboard, only: :show
  resources :invoices, :except => [:index]

  # Authentiation
  resources :sessions, only: [:new, :create, :destroy]

  match 'login'  => 'sessions#new', as: :login
  match 'logout' => 'sessions#destroy', as: :logout

  root :to => 'dashboards#show'
end
