class EpisodeSerializer < ActiveModel::Serializer
  attributes :id,
    :sequence,
    :title,
    :prod_code,
    :plot,
    :season

end
