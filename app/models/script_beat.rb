class ScriptBeat < ActiveRecord::Base
  belongs_to :episode
  has_many :script_beat_characters
  has_many :characters, through: :script_beat_characters

  accepts_nested_attributes_for :characters

  enum beat_type: [
    :slugline,
    :action,
    :character,
    :dialogue,
    :parenthetical,
    :extension,
    :dual_dialogue,
    :lyrics,
    :transition,
    :notes,
    :section,
    :synopsis
  ]
end
