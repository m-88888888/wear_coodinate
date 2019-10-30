Rails.application.routes.draw do
  # ユーザー
  devise_for :users, controllers: {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }
  resources :users, only: [:show, :index]

  # 記事
  root 'articles#index'
  resources :articles
  resources :gears

  # いいね
  post   '/like/:article_id' => 'likes#like',   as: 'like'
  delete '/like/:article_id' => 'likes#unlike', as: 'unlike'
end
