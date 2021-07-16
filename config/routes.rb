Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'

  Rails.application.routes.draw do
    devise_for :users
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :quotes, only: [:new, :create, :destroy]
  resources :votes, only: [:new, :create]
  resources :mailer, only: [:new]

  root to: "quotes#new"
end
