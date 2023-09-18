class Item < ApplicationRecord
    has_many :basket_items, dependent: :delete_all
end
