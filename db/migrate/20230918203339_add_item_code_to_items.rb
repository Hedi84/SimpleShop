class AddItemCodeToItems < ActiveRecord::Migration[7.0]
  def change
    change_table :items do |t|
      t.string :item_code, null: false
    end
  end
end
