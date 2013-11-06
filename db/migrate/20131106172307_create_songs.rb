class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :external_id
      t.string :name
      t.string :artist
      t.string :album
      t.integer :duration
      t.string :thumb100
      t.string :thumb60
      t.string :itunes
      t.string :audio

      t.timestamps
    end
  end
end
