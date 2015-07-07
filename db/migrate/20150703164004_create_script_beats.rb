class CreateScriptBeats < ActiveRecord::Migration
  def change
    create_table :script_beats do |t|
      t.integer :start_line
      t.integer :beat_type
      t.string :content
      t.belongs_to :episode, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
