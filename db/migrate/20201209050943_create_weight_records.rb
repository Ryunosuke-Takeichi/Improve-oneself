class CreateWeightRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :weight_records do |t|
      t.integer :user_id
      t.float :weight
      t.float :start_weight

      t.timestamps
    end
  end
end
