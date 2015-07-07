class Character < ActiveRecord::Base
  has_many :script_beat_characters
  has_many :script_beats, through: :script_beat_characters
end
