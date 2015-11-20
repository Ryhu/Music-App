class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.text :lyrics, null: false
      t.string :track_type, null: false
      t.integer :album_id, null: false
      t.integer :track_length, null: false

      t.timestamps null: false
    end
  end
end
