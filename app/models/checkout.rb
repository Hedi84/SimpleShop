class Checkout < ApplicationRecord
    has_many :rules
    has_one :basket, dependent: :destroy
    has_one :user, through: :basket


    def total
    end


    private

    def basket_items
        @basket_items ||= basket.basket_items
    end
end
