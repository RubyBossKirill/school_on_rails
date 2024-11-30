class ChangeFromDateAndToDateToDateType < ActiveRecord::Migration[7.1]
  def change
    change_column :events, :from_date, :date
    change_column :events, :to_date, :date
  end
end
