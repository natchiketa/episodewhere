class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :s
      t.references :tv_show, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
