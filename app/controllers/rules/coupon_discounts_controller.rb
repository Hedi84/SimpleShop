class Rules::CouponDiscountsController < ApplicationController
    before_action :find_coupon_discount, only: [:show, :destroy]

    def new
        @coupon_discount = Rules::CouponDiscount.new
        rule = Rule.new
        @coupon_discount.rule = rule
    end

    def create
        @coupon_discount = Rules::CouponDiscount.create(coupon_discount_params)
        redirect_to rules_path
    end

    def show
    end

    def destroy
        if @coupon_discount.delete
            redirect_to root_path
        end
    end

    private
    
    def coupon_discount_params
        params.require(:rules_coupon_discount).permit(rule_attributes: [:name, :discount])
     end

     def find_coupon_discount
        @coupon_discount ||= Rules::CouponDiscount.find(params[:id])
     end
end
