# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

require 'rack/cors'
use Rack::Cors do
  allow do
    origins 'localhost:3000', '127.0.0.1:3000', 'localhost:8080', 'localhost:5000'
    resource '**/*', :headers => 'Authorization', :methods => [
      :get, :post, :delete, :put, :patch, :options, :head
    ]
  end
end
