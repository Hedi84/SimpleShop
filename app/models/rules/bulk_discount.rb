class Rules::BulkDiscount < ApplicationRecord
    has_one :rule, as: :ruling
    accepts_nested_attributes_for :rule
    validates :item_code, uniqueness: true

    def apply basket
        items = basket.basket_items.select { |i| i.item.item_code == item_code }
        if items.count >= items_number
            co = checkout(basket)
            discount = (items_number/items.count).floor * rule.discount
            co.calculated_total -= discount

            co.save
        end
    end

    private

    def checkout basket
        @checkout ||= basket.checkout
    end

    def bulk_item code
        @item ||= Item.where(item_code: code).first
    end
end
