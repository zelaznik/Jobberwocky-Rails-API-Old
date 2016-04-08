require_relative '../lib/api_constraints.rb'

Jobberwocky::Application.routes.draw do
  namespace :static, path: "/static" do
    resources :job_applications
    resources :statuses
    resources :companies
  end

  namespace :api, defaults: { format: :json }, path: "/"  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1) do
      match '*/*' => 'cors#preflight', :via => :options

      get 'auth/new', to: "auth#new"
      get 'auth/callback', to: 'auth#callback'
      devise_for :users, :controllers => { :omniauth_callbacks => "api/v1/callbacks" }

      resource :sessions, only: [:create, :destroy]
      resources :users, only: [:show, :index, :create, :update, :destroy] do
        resources :products, only:  [:create, :update, :destroy]
        resources :orders, only: [:create, :index, :show]
      end
      resources :products, only: [:show, :index]
    end
  end
end
