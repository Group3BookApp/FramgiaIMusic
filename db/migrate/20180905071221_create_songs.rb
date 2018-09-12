class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :data
      t.string :avatar
      t.integer :listening
      t.references :category, foreign_key: true
      t.references :album, foreign_key: true
      t.references :artist, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
