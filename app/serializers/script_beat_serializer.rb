class ScriptBeatSerializer < ActiveModel::Serializer
  attributes :id,
    :start_line,
    :beat_type,
    :content,
    :start_time,
    :end_time,
    :episode_id,
    :character_ids

end
