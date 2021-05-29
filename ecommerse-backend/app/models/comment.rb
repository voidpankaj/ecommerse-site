class Comment < ApplicationRecord
	belongs_to :quotation_request
	validates :data, presence: true
	validates :send_user_id, presence: true

	def details_hash
		_detail = {
			:text => data,
			:created_at => created_at
		}
		if self.send_user_id == quotation_request.customer_id
			_detail[:send_name] = quotation_request.customer.name
			_detail[:receiver_name] = quotation_request.store_owner.name
		else
			_detail[:send_name] = quotation_request.store_owner.name
			_detail[:receiver_name] = quotation_request.customer.name
		end
		_detail
	end
end
