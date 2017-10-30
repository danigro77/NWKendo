class CreateRepeatingMeetings < ActiveRecord::Migration[5.1]
  def change
    create_table :repeating_meetings do |t|
      t.string :name
      t.text :description
      t.string :days
      t.time :start_time
      t.time :end_time
      t.string :location

      t.timestamps
    end
  end
end
