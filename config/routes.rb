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
    get '/search', to: 'gears#search', as: 'search', on: :collection
    get '/narrow_down', to: 'gears#search_gear', as: 'narrow_down', on: :collection
    # post '/rakuten_search', to: 'gears#rakuten_search', as: 'rakuten_search', on: :collection
    post '/rakuten_search', to: 'gears#rakuten_search', as: 'rakuten_search'
  end

  # いいね
  post   '/like/:article_id' => 'likes#like',   as: 'like'
  delete '/like/:article_id' => 'likes#unlike', as: 'unlike'
end
