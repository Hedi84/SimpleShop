class ItemsController < ApplicationController
    before_action :find_item, only: [:show, :edit, :update, :delete]
    def index
        @items = Item.all
    end

    def show
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.create(item_params)
    end

    def delete
    end

    def edit
    end

    def update
        @item.update(item_params)
    end

    private

    def find_item
        @item = Item.find(params[:id])
    end

    def item_params
        params.require(:item).permit(:name, :price, :description)
    end
end
