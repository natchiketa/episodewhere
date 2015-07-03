json.array!(@seasons) do |season|
  json.extract! season, :id, :s, :tv_show_id
  json.url season_url(season, format: :json)
end
