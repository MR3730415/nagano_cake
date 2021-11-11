class Item < ApplicationRecord
    has_many :carat_items, dependent: :destroy
    has_many :order_detail, dependent: :destroy
    belongs_to:item
end
