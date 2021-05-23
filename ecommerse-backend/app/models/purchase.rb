class Purchase < ApplicationRecord
	has_many :order_items
end
