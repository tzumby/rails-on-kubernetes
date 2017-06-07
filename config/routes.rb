Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users

  root to: "devise/sessions#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
