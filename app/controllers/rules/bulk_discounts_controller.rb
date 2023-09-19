class Rules::BulkDiscountsController < ApplicationController
    before_action :find_bulk_discount, only: [:show, :destroy]

    def new
        @bulk_discount = Rules::BulkDiscount.new
        rule = Rule.new
        @bulk_discount.rule = rule
    end

    def create
        @bulk_discount = Rules::BulkDiscount.create(bulk_discount_params)
        redirect_to rules_path
    end

    def show
    end

    def destroy
        if @bulk_discount.delete
            redirect_to root_path
        end
    end

    private

    def find_bulk_discount
        @bulk_discount ||= Rules::BulkDiscount.find(params[:id])
    end

    def bulk_discount_params
        params.require(:rules_bulk_discount).permit(:items_number, :item_code, rule_attributes: [:name, :discount])
     end
end
