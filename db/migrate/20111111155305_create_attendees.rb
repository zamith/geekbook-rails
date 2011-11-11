class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|

      t.timestamps
    end
  end
end
