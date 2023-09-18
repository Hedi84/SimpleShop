class Rules::BulkDiscount < ApplicationRecord
    has_one :rule, as: :ruling
    accepts_nested_attributes_for :rule
    validates :item_code, uniqueness: true
end
