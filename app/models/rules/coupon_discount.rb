class Rules::CouponDiscount < ApplicationRecord
    has_one :rule, as: :ruling
    accepts_nested_attributes_for :rule

    def apply basket
        co = checkout(basket)
        co.calculated_total -= discount
        co.save
    end

    private

    def checkout basket
        @checkout ||= basket.checkout
    end
end
