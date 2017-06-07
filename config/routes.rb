Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
