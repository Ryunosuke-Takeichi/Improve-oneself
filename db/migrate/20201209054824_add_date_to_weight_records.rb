class AddDateToWeightRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :weight_records, :date, :datetime
  end
end
