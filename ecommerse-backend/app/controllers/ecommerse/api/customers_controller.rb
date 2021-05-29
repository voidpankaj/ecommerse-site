class Ecommerse::Api::CustomersController < ApplicationController
	before_action :load_customer, :except => [:index]

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
					:catalog_id => item.catalog_id,
					:owner_id => item.catalog.store_owner_id
				}
			end
		else
			mssg = "Your Lite licence has been expired, Please contact with respective Admin"
		end
		render :json=> {:success=>true, :products => data, :mssg => mssg}
	end

	def fetch_quotation_requests
		render :json=> {:success=>true, :data => {:quotes => @customer.get_quotes_details}}
	end

	private

	def load_customer
		@customer||= Customer.where(:id => params[:customer_id]).last
		raise "not found" if @customer.blank?
	end
	# render json: { errors: @post.errors.full_messages.join(', ') }, status: :unprocessable_entity

end
