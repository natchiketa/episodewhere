class EpisodePreviewSerializer < ActiveModel::Serializer
  attributes :id,
    :sequence,
    :title,
    :prod_code,
    :plot

  has_one :season

  def sequence
    object.sequence.to_s.rjust(2, '0')
  end
end
