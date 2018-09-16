class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :avatar
      t.text :description

      t.timestamps
    end
  end
end
