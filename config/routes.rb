Rails.application.routes.draw do
  resources :script_beat_characters
  resources :script_beats
  resources :characters
  resources :episodes
  resources :seasons
  devise_for :users
  resources :users
  resources :tv_shows
  root to: 'tv_shows#index'
end
