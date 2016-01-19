Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  devise_scope :user do
    get 'sign_in',  to: 'sessions#new',            as: :new_user_session
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  authenticate do
    get '/all'     => 'deploys#all', as: :all_deploys
    root to: 'deploys#index'
  end

  get '/deploy' => 'deploys#deploy'
  get '/deploy/:deploy_sha/comments' => 'comments#index', as: :deploy_comments
  get '/deploy/:deploy_sha/new' => 'comments#new', as: :new_deploy_comment
  post '/comments' => 'comments#create', as: :comments
  get '/ping'   => 'deploys#ping'
  get '/denied' => 'deploys#denied', as: :access_denied
end
