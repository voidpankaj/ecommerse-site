class Ecommerse::Api::PurchasesController < ApplicationController
	before_action :load_cart_purchase

	def add_to_cart
		@purchase||= Purchase.create_purchase(params)
		@purchase.create_or_update_cart_item(params[:item_param])
		render_cart_data(@purchase)
	end

	def fetch_active_cart
		 # or raise("not found"
		render_cart_data(@purchase)
	end

	def update_cart_data
		# purchase = Purchase.find_by_number params[:purchase_id]
		@purchase.update_cart_data(params[:items])
		render_cart_data(purchase)
	end


	private

	def load_cart_purchase
		@purchase = Purchase.find_by_number params[:purchase_id]
		@purchase ||= Purchase.where(customer_id: params[:customer_id], status: 'in_checkout').last
		# raise "Not Found" if @purchase.blank?
	end

	def render_cart_data(purchase)
		if !purchase || (purchase && purchase.errors.blank?)
			render json: {status: true, cart_data: purchase.try(:prepare_cart_data)}
		else
			render json: { errors: purchase.errors.full_messages.join(', ')}, status: :unprocessable_entity
		end
	end

end