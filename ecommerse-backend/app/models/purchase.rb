# require 'purchase/cart'
# require 'purchase/creation'
class Purchase < ApplicationRecord
	# include Creation
	# include Cart
	belongs_to :customer
	has_many :order_items
	# has_many :workflows, as: :workable, class_name: "Workflow::Base"
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

	def create_or_update_cart_item(item_param)
		oi = self.order_items.where(catalog_id: item_param[:catalog_id]).last
		return if oi.blank? && item_param[:quantity].to_i == 0
		oi ||= OrderItem.create_item(self, item_param[:quantity], item_param[:catalog_id])
		oi.quantity = item_param[:quantity]
		oi.save
		oi.destroy if oi.quantity == 0
	end

	def self.create_purchase(options)
		purchase = Purchase.new
		purchase.customer_id=options[:customer_id]
		purchase.save!
		purchase
	end

	def update_cart_data(items_param)
		items_param.each do |items_param|
			self.create_or_update_cart_item(items_param)
		end
	end

	def prepare_cart_data
		cart_data = {
			:purchase_id => self.number
		}
		cart_data[:items] = self.order_items.map do |oi|
			{
				:price => oi.price,
				:title => oi.title,
				:quantity => oi.quantity,
				:catalog_id => oi.catalog_id,
				:order_item_id => oi.id,
				:owner_id => oi.catalog.store_owner_id
			}
		end
		cart_data
	end

	# def quotation_request_workflows
	# 	self.workflows.select{|workflow| workflow.type="Workflow::QuotationRequest"}
	# end

	# def pending_quotation_request_workflow
	# 	self.quotation_request_workflows.detect{|workflow| workflow.in_progress?}
	# end

	# def submit_quote_request(params)
	# 	workflow = self.pending_quotation_request_workflow
	# 	if params[:comment]
	# 		request = workflow.pending_request
	# 		request.create_comment!(:data => params[:comment])
	# 	end
	# 	workflow.submit!
	# 	workflow
	# 	# workflow.create_quotation_request
	# # end

	# def prepare_qoute_cart_Data
	# 	workflow = self.pending_quotation_request_workflow
	# 	data = workflow.try(:prepare_qoute_cart_Data) || {}
	# 	data[:purchase_id] = self.number
	# 	data
	# end

	# def add_to_qoute_cart(params)
	# 	workflow = self.pending_quotation_request_workflow
	# 	workflow ||= Workflow::QuotationRequest.create!(:workable => self)
	# 	workflow.add_to_qoute_cart(params, self.customer_id)
	# end

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
