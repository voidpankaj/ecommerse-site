class QuoteItem < ApplicationRecord
	belongs_to :quotation_request
	belongs_to :order_item

	def cart_item_data
		{
			price: self.price,
			quote_price: self.quote_price,
			quantity: self.quantity,
			title: self.order_item.title,
			order_item_id: self.order_item.id,
			catalog_id: self.order_item.catalog_id
		}
	end
end
