class Basket < ApplicationRecord
  has_many :basket_items, dependent: :delete_all
  belongs_to :checkout
  belongs_to :user


  def total_price
      total_price = 0
      basket_items.each do |basket_item|
         total_price += basket_item.item.price
      end
      total_price
  end
end
