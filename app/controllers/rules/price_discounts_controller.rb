class Rules::PriceDiscountsController < ApplicationController
    before_action :find_price_discount, only: [:show, :destroy]

    def new
        @price_discount = Rules::PriceDiscount.new
        rule = Rule.new
        @price_discount.rule = rule
    end

    def create
        Rules::PriceDiscount.create(price_discount_params)
        redirect_to rules_path
    end

    def show
    end

    def destroy
        if @price_discount.delete
            redirect_to root_path
        end
    end

    private

    def find_price_discount
        @price_discount ||= Rules::PriceDiscount.find(params[:id])
    end

    def price_discount_params
        params.require(:rules_price_discount).permit(:total_price, rule_attributes: [:name, :discount])
    end
end
