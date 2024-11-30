class AddFromDateToEvent < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :from_date, :datetime
    add_column :events, :to_date, :datetime
  end
end
