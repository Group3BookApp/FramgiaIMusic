class AddStatusToLyrics < ActiveRecord::Migration[5.2]
  def change
    add_column :lyrics, :status, :boolean, default: false
  end
end
