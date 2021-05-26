class Ecommerse::Api::PurchasesController < ApplicationController

	def add_to_cart
		params[:cart_data] ||= {}
		@purchase = Purchase.find_by_number params[:cart_data][:purchase_id]
		@purchase||= Purchase.create_purchase(params)
		@purchase.add_cart_items(params)
		if @purchase.errors.blank?
			cart_data = {
				:purchase_id => @purchase.try(:number)
			}
			cart_data[:items] = @purchase.order_items.map do |oi|
				{
					:price => oi.price,
					:title => oi.title,
					:quantity => oi.quantity,
					:catalog_id => oi.catalog_id
				}
			end
			render json: {status: true, data: {:cart_data => cart_data, :customer_id => params[:customer_id]}}
		else
			render json: { errors: @purchase.errors.full_messages.join(', '), purchase_id: @purchase.try(:number) }, status: :unprocessable_entity
		end
	end

	def show
	end

end