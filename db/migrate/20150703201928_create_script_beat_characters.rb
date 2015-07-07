class CreateScriptBeatCharacters < ActiveRecord::Migration
  def change
    create_table :script_beat_characters do |t|
      t.references :script_beat, index: true, foreign_key: true
      t.references :character, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
