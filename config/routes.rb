Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static_pages#root'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }

  resources :google_actions, path: 'google-actions', only: [:create]
end
