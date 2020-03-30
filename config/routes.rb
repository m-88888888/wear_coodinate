Rails.application.routes.draw do
  root 'static#home'
  # ユーザー
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  resources :users, only: [:show, :edit, :update] do
  end

  # コーディネート
  resources :articles do
    get 'rank', on: :collection
    get '/gender/:gender', to: 'articles#index', as: 'gender_index', on: :collection
  end

  # アイテム
  resources :gears, only: [:index] do
    get '/search_article', to: 'gears#search_article', as: 'search_article', on: :collection
    get '/narrow_down', to: 'gears#search_gear', as: 'narrow_down', on: :collection
    # post '/rakuten_search', to: 'gears#rakuten_search', as: 'rakuten_search', on: :collection
    post '/rakuten_search', to: 'gears#rakuten_search', as: 'rakuten_search'
  end

  # いいね
  resources :likes, only: [:create, :destroy]
end
