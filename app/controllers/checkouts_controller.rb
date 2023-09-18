class CheckoutsController < ApplicationController
    before_action :find_checkout, only: [:show, :delete]

    def show
    end

    def delete
        redirect_to root_path
    end

    private

    def find_checkout
        @checkout ||= Basket.where(user_id: current_user.id).first.checkout
    end
    def basket
        @basket ||= @checkout.basket
    end

    def basket_items
        @basket_items ||= basket.basket_items
    end
end
