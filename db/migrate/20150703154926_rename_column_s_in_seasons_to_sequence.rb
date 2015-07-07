class RenameColumnSInSeasonsToSequence < ActiveRecord::Migration
  def change
    rename_column :seasons, :s, :sequence
  end
end
