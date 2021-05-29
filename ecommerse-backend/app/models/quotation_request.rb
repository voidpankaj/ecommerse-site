class QuotationRequest < ApplicationRecord
	has_many :quote_items
	has_one :comment, as: :commentable
	belongs_to :workflow, class_name: "Workflow::Base"
	state_machine :status, initial: :init do
		event :request do
			transition [:init] => :requested
		end
		event :approve do
			transition [:requested] => :approved
		end
		event :reject do
			transition [:requested] => :rejected
		end
		event :cancel do
			transition [:requested] => :canceled
		end
	end

	def add_to_qoute_cart(item_param)
		item = self.quote_items.where(order_item_id: item_param[:order_item_id]).last
		item||= self.quote_items.build(order_item_id: item_param[:order_item_id])
		item.quantity = item_param[:quantity]
		item.quote_price = item_param[:quote_price]
		item.price = item_param[:price]
		item.save
		# item.update(item_param.slice(:quantity, :quote_price, :price))
		item.delete if item.quantity == 0
	end

	def prepare_qoute_cart_Data
		items = self.quote_items.map do |item|
			item.cart_item_data
		end
		{:items => items}
	end
end
