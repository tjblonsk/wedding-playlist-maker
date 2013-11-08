class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :song_id
      t.integer :love, :default => 0
      t.integer :hate, :default => 0

      t.timestamps
    end
  end
end
