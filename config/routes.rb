Rails.application.routes.draw do
  resources :adspots
  resources :agents

  root to: 'adspots#new'
end
