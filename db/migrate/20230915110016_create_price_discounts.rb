class CreatePriceDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :price_discounts do |t|
      t.float :total_price

      t.timestamps
    end
  end
end
