require_relative '../lib/api_constraints.rb'

Jobberwocky::Application.routes.draw do
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: "/"  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      devise_for :users
      resources :users, only: [:show, :create, :update, :destroy] do
        resources :products, only: [:create, :update, :destroy]
      end
      resources :products, only: [:show, :index]
    end
  end
end
