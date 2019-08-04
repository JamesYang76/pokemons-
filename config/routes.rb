Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  root 'pokemons#index'

  resources :pokemons, only: [:index]
  post 'pokemons/upload', to: 'pokemons#upload'
  post 'pokemons/destroy_all', to: 'pokemons#destroy_all'
end
