class Ecommerse::Api::QuotationRequestsController < ApplicationController
	before_action :load_draft_request, :except => [:update_quote_request, :add_comment]
	before_action :load_pending_request, :only => [:update_quote_request, :add_comment, :update_status]

	def add_to_qoute_cart
		@qoute_request ||= QuotationRequest.create_quotation_request(params)
		@qoute_request.add_to_qoute_cart(params[:item_param])
		render_qoute_data(@qoute_request)
	end

	def fetch_draft_quote_request
		render_qoute_data(@qoute_request)		
	end

	def submit_quote_request
		if @qoute_request.submit_quote_request(params)
			render json: {status: 200, cart_id: @qoute_request.id}
		else
			render json: { errors: @qoute_request.errors.full_messages.join(', ')}, status: :unprocessable_entity
		end		
	end

	def update_quote_request
		@qoute_request.update_quote_request(params)
		render_qoute_data(@qoute_request)
	end

	def add_comment
		@qoute_request.add_comment(params)
		render_qoute_data(@qoute_request)
	end

	def update_status
		@qoute_request.send(params[:status])
		if @qoute_request.errors.empty?
			render json: {status: 200, message: "Status updated successfully!"}
		else
			render json: { errors: @qoute_request.errors.full_messages.join(', ')}, status: :unprocessable_entity
		end
	end

	private

	def load_pending_request
		@qoute_request = QuotationRequest.where(:id => params[:id]).includes([{:quote_items => {:order_item => :catalog}}, :comments, :customer, :store_owner]).last
	end

	def load_draft_request
		@qoute_request = QuotationRequest.where(:customer_id => params[:customer_id], :status => "draft").includes([{:quote_items => {:order_item => :catalog}}, :comments, :customer, :store_owner]).last
	end

	def render_qoute_data(quote)
		if !quote || (quote && quote.errors.empty?)
			render json: {status: 200, cart_data: quote.try(:prepare_qoute_data)}
		else
			render json: { errors: quote.errors.full_messages.join(', ')}, status: :unprocessable_entity
		end
	end

end