Rails.application.routes.draw do
  resources :script_beat_characters
  resources :script_beats
  resources :characters

  resources :episodes do
    get 'beats', action: :beats, as: :beats
    get 'beats/vlc/connect', action: :connect, as: :connect
    get 'beats/vlc/play', action: :play, as: :play
    get 'beats/vlc/time', action: :time, as: :time
    get 'beats/vlc/seek', action: :seek, as: :seek
  end

  resources :seasons
  devise_for :users
  resources :users
  resources :tv_shows
  root to: 'tv_shows#index'
end
