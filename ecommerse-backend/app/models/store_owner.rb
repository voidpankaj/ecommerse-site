class StoreOwner < ApplicationRecord
	belongs_to :user
	has_many :catalogs
	has_many :issued_licences, class_name: "LiteLicence"
	has_many :quotes, class_name: "QuotationRequest"

	def name
		user.name
	end

	def get_quotes_details
		data = []
		self.quotes.each do |quote|
			next if quote.draft?
			quote_hash = quote.prepare_qoute_data
			if quote.pending?
				quote_hash[:can_edit] = true
				quote_hash[:can_reject] = quote.can_reject?
				quote_hash[:can_approve] = quote.can_approve?
			end
			data << quote_hash
		end
		data
	end
end
