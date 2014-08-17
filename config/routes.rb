Rails.application.routes.draw do
  resources :adspots
  resources :agents

  root to: 'agents#new'
  match 'zip', to: 'adspots#get_adspot', via: :post
end
