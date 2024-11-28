class AddCategoryToEvent < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :category
    add_reference :events, :category, null: false, foreign_key: true
  end
end
