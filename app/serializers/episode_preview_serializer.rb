class EpisodePreviewSerializer < ActiveModel::Serializer
  attributes :id,
    :sequence,
    :title,
    :prod_code,
    :plot
end
