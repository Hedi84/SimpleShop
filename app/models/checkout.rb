class Checkout < ApplicationRecord
    has_many :rules, dependent: :destroy
    has_one :basket

end
