Rails.application.routes.draw do
  root to: 'deploys#index'
  post '/deploy' => 'deploys#deploy'
  get  '/ping' => 'deploys#ping'
end
