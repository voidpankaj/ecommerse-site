class QuoteItem < ApplicationRecord
	belongs_to :quotation_request
	belongs_to :order_item
	validates :quantity, presence: true
	validates :quote_price, presence: true
	validates :price, presence: true

	def item_details_hash
		{
			price: self.price,
			quote_price: self.quote_price,
			quantity: self.quantity,
			title: self.order_item.title,
			order_item_id: self.order_item.id,
			owner_id: self.order_item.catalog.store_owner_id
		}
	end
end
