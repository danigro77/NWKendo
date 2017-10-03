class AddPhotographerToImages < ActiveRecord::Migration[5.1]
  def change
    remove_column :images, :photographer
    add_column :images, :photographer_id, :integer
    add_foreign_key :images, :photographers
  end
end
