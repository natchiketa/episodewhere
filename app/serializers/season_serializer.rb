class SeasonSerializer < ActiveModel::Serializer
  attributes :id, :sequence

  has_one :tv_show, embedded: true

  def sequence
    object.sequence.to_s.rjust(2, '0')
  end
end
