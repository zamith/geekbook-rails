class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :name,           :limit => 64
      t.string :avatar_filename, :limit => 128
      t.integer :geek_votes, :default => 0
      t.string :profile_url

      t.timestamps
    end
  end
end
