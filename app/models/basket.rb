class Basket < ApplicationRecord
  has_many :items
  belongs_to :checkout

  def initialize
  end

  def add item_name
    Item.create(
      name: item_name,
    )
  end

  def total
      total_price = 0
      items.each do |item|
         total_price += item.price
      end
      total_price
  end
end
