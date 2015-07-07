class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :sequence
      t.string :title
      t.string :prod_code
      t.string :plot
      t.belongs_to :season, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
