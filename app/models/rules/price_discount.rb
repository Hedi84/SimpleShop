class Rules::PriceDiscount < ApplicationRecord
    has_one :rule, as: :ruling
    accepts_nested_attributes_for :rule

    def apply basket
        if basket.total >= total_price
            co = checkout(basket)
            co.calculated_total -= rule.discount
            co.save
        end
    end

    private

    def checkout basket
        @checkout ||= basket.checkout
    end
end
