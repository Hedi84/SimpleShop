class Checkout < ApplicationRecord
    has_many :rules
    has_one :basket, dependent: :destroy
    has_one :user, through: :basket


    def calculate_total
        # in practice it is important which type of discount to apply first
        self.calculated_total = basket.total_price
        self.save
        active_rules.each do |rule|
            rule.ruling.apply(basket)
        end
    end


    private

    def basket_items
        @basket_items ||= basket.basket_items
    end

    def active_rules
        @active_rules ||= Rule.where(active: true)
    end
end
