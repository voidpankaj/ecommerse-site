class StoreOwner < ApplicationRecord
	belongs_to :user
	has_many :catalogs
	has_many :issued_licences, class_name: "LiteLicence"
	has_many :quotes, class_name: "QuotationRequest"

	def name
		user.name
	end
end
