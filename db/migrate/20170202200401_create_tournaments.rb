class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.datetime :date
      t.string :location

      t.timestamps
    end
  end
end
