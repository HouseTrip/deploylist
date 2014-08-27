Rails.application.routes.draw do
  root to: 'deploys#index'
  get '/ping' => 'deploys#ping'
end
