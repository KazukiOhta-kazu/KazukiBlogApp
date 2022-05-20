Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :users

  root to: 'articles#index'

  resources :articles

  resource :timeline, only: [:show]

  resource :profile, only: [:show, :edit, :update]

  resources :favorites, only: [:index]

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  namespace :api, defaults: {format: :json} do
    scope '/articles/:article_id' do
      resources :comments, only: [:index, :create]
      resource :like, only: [:show, :create, :destroy]
    end
  end
end
