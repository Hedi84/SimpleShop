class ChangeItemCodeToString < ActiveRecord::Migration[7.0]
  def change
    change_column(:bulk_discounts, :item_code, :string)
  end
end
