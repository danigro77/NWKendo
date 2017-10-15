class AddColumnsToResources < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :description, :text
    add_column :resources, :category_id, :integer
    add_foreign_key :resources, :categories
  end
end
