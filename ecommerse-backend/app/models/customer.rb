class Customer < ApplicationRecord
	has_one :licence, class_name: "LiteLicence"
	belongs_to :user
	has_many :quotes, class_name: "QuotationRequest"

	def get_quotes_details
		data = []
		self.quotes.includes([{:quote_items => {:order_item => :catalog}}, :comments, :customer, :store_owner]).each do |quote|
			next if quote.draft?
			quote_hash = quote.prepare_qoute_data
			if quote.pending?
				quote_hash[:can_edit] = true
				quote_hash[:can_edit_quantity] = true
				quote_hash[:can_cancel] = quote.can_cancel?
			end
			data << quote_hash
		end
		data
	end

	def name
		user.name
	end
end
