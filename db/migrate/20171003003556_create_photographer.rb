class CreatePhotographer < ActiveRecord::Migration[5.1]
  def change
    create_table :photographers do |t|
      t.string :full_name
      t.string :contact_email

      t.timestamps
    end
  end
end
