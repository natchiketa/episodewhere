class EpisodeSerializer < ActiveModel::Serializer
  attributes :id,
    :sequence,
    :title,
    :prod_code,
    :plot,
    :season

  has_many :script_beats, embedded: true
end
