class ScriptBeatSerializer < ActiveModel::Serializer
  attributes :id,
    :start_line,
    :beat_type,
    :content,
    :start_time,
    :end_time,
    :episode_id

  # has_one :episode, embedded: true
  has_many :characters, embedded: true
end
