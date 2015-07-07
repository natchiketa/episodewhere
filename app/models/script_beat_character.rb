class ScriptBeatCharacter < ActiveRecord::Base
  belongs_to :script_beat
  belongs_to :character
end
