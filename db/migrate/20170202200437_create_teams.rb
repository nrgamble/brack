class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.references :tournament, foreign_key: true
      t.references :pool, foreign_key: true
      t.string :name
      t.string :email
      t.float :win_percentage
      t.integer :plus_minus

      t.timestamps
    end
  end
end
