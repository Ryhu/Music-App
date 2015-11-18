class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.integer :album_length_time, null: false
      t.string :album_type, null: false
      t.integer :band_id, null: false

      t.timestamps null: false
    end
  end
end
