class LiteLicence < ApplicationRecord
	belongs_to :customer
	belongs_to :store_owner
	has_many :licence_items
	def expired?
		self.expiry_date.present? && self.expiry_date < Time.now
	end

end
