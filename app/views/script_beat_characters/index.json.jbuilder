json.array!(@script_beat_characters) do |script_beat_character|
  json.extract! script_beat_character, :id, :script_beat_id, :character_id
  json.url script_beat_character_url(script_beat_character, format: :json)
end
