json.array!(@script_beats) do |script_beat|
  json.extract! script_beat, :id, :start_line, :beat_type, :content, :episode_id
  json.url script_beat_url(script_beat, format: :json)
end
