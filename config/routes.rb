Rails.application.routes.draw do
  devise_for :users
  require 'sidekiq/web'
  require 'sidekiq/cron/web'

  Rails.application.routes.draw do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :quotes, only: [:new, :create]
  resources :votes, only: [:new, :create]
  resources :mailer, only: [:new]

  root to: "quotes#new"
end
