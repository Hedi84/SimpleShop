class Basket < ApplicationRecord
  has_many :basket_items
  belongs_to :checkout
  belongs_to :user

  # def add item_name
  #   Item.create(
  #     name: item_name,
  #   )
  # end

  def total
      total_price = 0
      basket_items.each do |basket_item|
         total_price += basket_item.item.price
      end
      total_price
  end
end
