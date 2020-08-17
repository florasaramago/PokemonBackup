Rails.application.routes.draw do
  root "backups#index"

  resources :backups, only: %i[ index create destroy ]
end
