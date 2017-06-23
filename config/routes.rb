Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
