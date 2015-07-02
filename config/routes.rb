Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :tv_shows
  root to: 'tv_shows#index'
end
