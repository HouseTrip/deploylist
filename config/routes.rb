Rails.application.routes.draw do
  get '/all' => 'deploys#all', as: :all_deploys

  get '/deploy' => 'deploys#deploy'
  get  '/ping' => 'deploys#ping'

  root to: 'deploys#index'
end
