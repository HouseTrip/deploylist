Rails.application.routes.draw do
  resources :comments
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
  get '/ping'   => 'deploys#ping'
  get '/denied' => 'deploys#denied', as: :access_denied
end
