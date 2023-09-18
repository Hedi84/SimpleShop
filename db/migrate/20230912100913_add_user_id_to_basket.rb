class AddUserIdToBasket < ActiveRecord::Migration[7.0]
  def change
    add_reference :baskets, :user, index: true
  end
end
