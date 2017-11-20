class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :url
      t.date :taken_on
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
