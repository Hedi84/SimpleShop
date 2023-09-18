class BasketsController < ApplicationController
    before_action :find_basket, only: [:show, :update, :delete]

    def create
        @basket = Basket.create(basket_params)
        Checkout.create(user: current_user, basket: @basket)
        redirect_to basket_path(@basket)
    end

    def show
       basket_items
    end

    def delete
        @basket.delete
        redirect_to root_path
    end

    private

    def find_basket
        @basket ||= Basket.find_by(user_id: current_user.id)
    end

    def basket_params
        params.require(:basket).permit(:user_id, checkout_id)
    end

    def basket_items
        @basket_items ||= @basket.basket_items
    end
end
