class OrderItem < ApplicationRecord
	belongs_to :purchase
	belongs_to :catalog
	# validate negative qty
	def self.create_item(purchase, qty, catalog_id, options={})
		c = Catalog.find(catalog_id)
		oi = self.new(purchase: purchase, catalog: c, quantity: qty, price: c.price) 
		oi.save!
		oi
	end

	def title
		catalog.title
	end
end
