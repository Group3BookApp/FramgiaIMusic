class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :avatar
      t.string :data
      t.integer :listening
      t.references :album
      t.references :category
      t.references :artist
      t.references :author

      t.timestamps
    end
  end
end
