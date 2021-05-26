# require 'purchase/cart'
# require 'purchase/creation'
class Purchase < ApplicationRecord
	# include Creation
	# include Cart
	has_many :order_items
	before_create :generate_purchase_number
	PURCHASE_NUMBER_PREFIX = "811"

	state_machine :status, initial: :in_checkout do
		event :confirm do
			transition [:in_checkout] => :confirmed
		end
		event :cancel do
			transition [:confirmed] => :canceled
		end
	end

	def add_cart_items(params)
		params[:cart_data][:items].each do |item_param|
			oi = self.order_items.where(catalog_id: item_param[:catalog_id]).last
			next if oi.blank? && item_param[:quantity].to_i == 0
			oi ||= OrderItem.create_item(self, item_param[:quantity], item_param[:catalog_id])
			oi.quantity = item_param[:quantity]
			oi.save
			oi.destroy if oi.quantity == 0
		end
	end

	def self.create_purchase(options)
		purchase = Purchase.new
		purchase.customer_id=options[:customer_id]
		purchase.save!
		purchase
	end

	private

	def generate_purchase_number
		record = true
		while record
			random = "#{PURCHASE_NUMBER_PREFIX}#{Array.new(8){rand(10)}.join}"
			record = Purchase.where(number: random).count > 0 ? true : false
		end
		self.number = random
	end
end
