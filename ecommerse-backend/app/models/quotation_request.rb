class QuotationRequest < ApplicationRecord
	has_many :quote_items
	has_many :comments, -> {order(created_at: :desc)}
	belongs_to :customer
	belongs_to :store_owner
	validates :customer_id, presence: true
	validates :store_owner_id, presence: true
	validates :store_owner_id, presence: true

	state_machine :status, initial: :draft do
		event :pending do
			transition [:draft] => :pending
		end
		event :approve do
			transition [:pending] => :approved
		end
		event :reject do
			transition [:pending] => :rejected
		end
		event :cancel do
			transition [:pending] => :canceled
		end
	end

	def self.create_quotation_request(params)
		request = QuotationRequest.new(:customer_id => params[:customer_id], :store_owner_id => params[:item_param][:owner_id])
		request.save!
		request
	end

	def submit_quote_request(params)
		if params[:comment].present?
			params[:send_user_id] = customer_id
			params[:receiver_user_id] = store_owner_id
			self.add_comment(params)
		end
		self.pending!
	end


	def add_to_qoute_cart(item_param)
		item = self.quote_items.where(order_item_id: item_param[:order_item_id]).last
		item||= self.quote_items.build(order_item_id: item_param[:order_item_id])
		item.quantity = item_param[:quantity]
		item.quote_price = item_param[:quote_price]
		item.price = item_param[:price]
		item.save!
		item.delete if item.quantity == 0
	end

	def add_comment(params)
		self.comments.create(:data => params[:comment], :send_user_id => params[:send_user_id], :receiver_user_id => params[:receiver_user_id])
	end

	def update_quote_request(params)
		params[:items].each do |item_param|
			self.add_to_qoute_cart(item_param)
		end
	end

	def prepare_qoute_data
		quote_data = {}
		quote_data[:items] = self.quote_items.map do |item|
			item.item_details_hash
		end
		quote_data[:customer_id] = self.customer_id
		quote_data[:owner_id] = self.store_owner_id
		quote_data[:created_at] = self.created_at
		quote_data[:status] = self.status
		quote_data[:id] = self.id
		quote_data[:comments] = self.comments_hash
		quote_data
	end

	def comments_hash
		data = self.comments.map do |comment|
			comment.details_hash
		end
		data
	end

end
