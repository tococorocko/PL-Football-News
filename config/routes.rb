Rails.application.routes.draw do
  root to: 'teams#index'
  resources :teams, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
