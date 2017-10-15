class AddLinkToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :link_to_page, :integer
  end
end
