class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true
      t.references :favorite, foreign_key: true
      t.integer :num_rate
      t.float :avg_rate

      t.timestamps
    end
  end
end
