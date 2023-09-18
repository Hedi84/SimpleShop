class Rules::CouponDiscount < ApplicationRecord
    has_one :rule, as: :ruling
    accepts_nested_attributes_for :rule
end
