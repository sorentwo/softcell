Softcell::Application.routes.draw do
  resource :dashboard, :only => :show
  resources :invoices

  root :to => 'dashboards#show'
end
