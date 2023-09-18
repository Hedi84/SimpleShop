class CreateBulkDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :bulk_discounts do |t|
      t.integer :items_number
      t.integer :item_code

      t.timestamps
    end
  end
end
