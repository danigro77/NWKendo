class AddImgUrlToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :image_url, :string

  end
end
