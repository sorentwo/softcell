Softcell::Application.routes.draw do
  resource  :dashboard, only:   [:show]
  resources :clients, except: [:index, :show]
  resources :invoices,  except: [:index] do
    member { get :print }
    member { post :clone }
  end

  root to: 'dashboards#show'
end
