class AddStartEndTimesToScriptBeats < ActiveRecord::Migration
  def change
    add_column :script_beats, :start_time, :decimal
    add_column :script_beats, :end_time, :decimal
  end
end
