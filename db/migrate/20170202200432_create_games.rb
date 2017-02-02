class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.references :tournament, foreign_key: true
      t.references :pool, foreign_key: true
      t.references :bracket, foreign_key: true
      t.integer :away_id
      t.integer :home_id
      t.integer :court_id
      t.integer :ref_id
      t.datetime :date
      t.integer :score_away
      t.integer :score_home

      t.timestamps
    end
  end
end
