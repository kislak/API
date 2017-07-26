Rails.application.routes.draw do
  resources :accounts do
    resources :transactions
  end
  # resources :users, only: [:show] do

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'panel#show'
end
