class AddBasketIdToItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :basket, foreign_key: true
  end
end
