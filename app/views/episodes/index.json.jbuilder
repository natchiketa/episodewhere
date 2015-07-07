json.array!(@episodes) do |episode|
  json.extract! episode, :id, :sequence, :title, :prod_code, :plot, :season_id
  json.url episode_url(episode, format: :json)
end
