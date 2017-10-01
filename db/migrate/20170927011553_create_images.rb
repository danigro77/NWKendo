class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :url, null: false
      t.string :title
      t.text :description
      t.integer :for_page, default: 0
      t.string :photographer

      t.timestamps
    end
  end
end
