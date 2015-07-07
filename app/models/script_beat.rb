class ScriptBeat < ActiveRecord::Base
  belongs_to :episode
  has_many :characters, through: :script_beat_characters

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
