class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :category
      t.string :organization

      t.timestamps
    end
  end
end
