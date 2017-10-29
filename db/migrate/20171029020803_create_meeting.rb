class CreateMeeting < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings do |t|
      t.string :name
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :location

      t.timestamps
    end
  end
end
