class Ecommerse::Api::CustomersController < ApplicationController
	before_action :load_customer, :only => [:get_licence_items]

	def index
	end

	def get_licence_items
		data = []
		mssg = ""
		if !@customer.licence.try(:expired?)
			data = @customer.licence.try(:licence_items).map do |item|
				{
					:price => item.catalog.price,
					:title => item.catalog.title,
					:catalog_id => item.catalog_id.
					:owner_id => item.catalog.store_owner_id
				}
			end
		else
			mssg = "Your Lite licence has been expired, Please contact with respective Admin"
		end
		render :json=> {:success=>true, :products => data, :mssg => mssg}
	end

	def fetch_quotation_requests
		@purchases = Purchase.includes(:workflows => [:quotation_requests => {:quote_items => :order_item}]).where(:customer_id => params[:customer_id])
		data = []
		@purchases.each do |purchase|
			purchase.workflows.each do |workflow|
				next if workflow.in_progress?
				cart_data = {}
				cart_data[:replies] = []
				workflow.quotation_requests.each do |quotation_request|
					items = quotation_request.quote_items.map do |item|
						item.cart_item_data
					end
					cart_data[:replies] << {
						:created_at => quotation_request.created_at,
						:initiated_by => quotation_request.initiated_by,
						:status => quotation_request.status,
						:comment => quotation_request.comment.try(:data),
						:items => items
					}
				end
				cart_data[:cart_id] = workflow.id
				cart_data[:status] = workflow.ui_status
				cart_data[:created_at] = workflow.created_at
				data << cart_data
			end
		end
		render :json=> {:success=>true, :data => {:quotes => data}}
	end

	private

	def load_customer
		@customer||= Customer.where(:id => params[:customer_id]).includes(:licence => {:licence_items=> :catalog}).last
		raise "not found" if @customer.blank?
	end
	# render json: { errors: @post.errors.full_messages.join(', ') }, status: :unprocessable_entity

end
