class AddCalculatedTotalToCheckout < ActiveRecord::Migration[7.0]
  def change
    add_column :checkouts, :calculated_total, :float, default: 0
  end
end
