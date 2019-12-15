Rails.application.routes.draw do
  # ユーザー
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }
  resources :users, only: [:show, :edit, :update] do
    # collection do
    #   patch 'update_password'
    # end
  end

  # 記事
  root 'articles#index'
  resources :articles do
    get "rank", on: :collection
    get "/gender/:gender", to: "articles#index", as: 'gender_index', on: :collection
  end

  #アイテム
  resources :gears, only: [ :index ] do
    get "/search", to: "gears#search", as: 'search', on: :collection
  end

  # いいね
  post   '/like/:article_id' => 'likes#like',   as: 'like'
  delete '/like/:article_id' => 'likes#unlike', as: 'unlike'
end
