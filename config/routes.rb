Rails.application.routes.draw do
  root to: 'deploys#index'
  get '/deploy' => 'deploys#deploy'
  get  '/ping' => 'deploys#ping'
end
