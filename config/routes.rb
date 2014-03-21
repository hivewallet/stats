HiveStats::Application.routes.draw do
  resources :snapshots, only: [:show]

  root 'snapshots#index'
end
