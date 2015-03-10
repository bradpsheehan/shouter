Shouter::Application.routes.draw do

  require 'monban/constraints/signed_in'

  constraints Monban::Constraints::SignedIn.new do
    root 'dashboards#show', as: :dashboard
  end

  root 'welcome#index'
  resource :search, only: [:show]

  resource :session, only: [:new, :create, :destroy]
  resources :shouts, only: [:create] do
    member do
      post 'reshout' => 'reshouts#create'
      delete 'unreshout' => 'reshouts#destroy'
    end
  end
  resources :users, only: [:new, :create, :show] do
    member do
      post 'follow' => 'following_relationships#create'
      delete 'unfollow' => 'following_relationships#destroy'
    end
  end

end
