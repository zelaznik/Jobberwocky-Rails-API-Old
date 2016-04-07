require_relative '../lib/api_constraints.rb'

Jobberwocky::Application.routes.draw do
  namespace :api, defaults: { format: :json }, path: "/"  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      match '*/*' => 'cors#preflight', :via => :options

      resource :sessions, only: [:create, :destroy]
      resources :users, only: [:show, :create, :update, :destroy] do
        resources :products, only:  [:create, :update, :destroy]
        resources :orders, :only => [:create, :index, :show]
      end
      resources :products, only: [:show, :index]
      devise_for :users
    end
  end
end
