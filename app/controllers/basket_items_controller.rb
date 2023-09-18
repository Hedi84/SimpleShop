class BasketItemsController < ApplicationController
    before_action :find_basket_item, only: [:show, :destroy]

    def create
        @basket_item = BasketItem.new(item_id: item_id, basket_id: basket_id)
        @basket_item.save
        redirect_to basket_path(basket_id)
    end

    def show
    end

    def destroy
        @basket_item.delete
        redirect_to basket_path(basket_id)
    end

    private

    def item_id
        @item_id = params[:item_id]
    end

    def find_basket_item
        @basket_item ||= BasketItem.find(params[:id])
    end

    def basket_id
        @basket ||=
            Basket.where(user_id: current_user.id).first&.id || Basket.create(user_id: current_user.id, checkout_id: checkout.id).id
    end

    def checkout
        @checkout ||= Checkout.create
    end
end
