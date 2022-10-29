Rails.application.routes.draw do
  root to: 'actors#index'

  resources :heaters, only: [:update]
end
