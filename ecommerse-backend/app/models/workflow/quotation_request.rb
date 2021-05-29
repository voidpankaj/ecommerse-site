class Workflow::QuotationRequest < Workflow::Base
	has_many :quotation_requests, class_name: "::QuotationRequest", foreign_key: "workflow_id"

	def add_to_qoute_cart(params, initiated_by)
		request = self.pending_request
		request ||= self.quotation_requests.create!(initiated_by: initiated_by,send_to: params[:item_param][:owner_id])
		request.add_to_qoute_cart(params[:item_param])
	end

	def prepare_qoute_cart_Data
		request = self.quotation_requests.where(status: "init").last
		data = request.prepare_qoute_cart_Data
		data[:qoute_cart_id] = self.id
		data
	end

	def pending_request
		self.quotation_requests.where(status: "init").last
	end

	def update_qoute_request_status
		self.pending_request.request!
	end

	def ui_status
		statuses = self.quotation_requests.map(&:status).uniq
		if statuses.include?("approved")
			return "Approved"
		elsif statuses.include?("rejected")
			return "Rejected"
		else
			return "Pending"
		end
	end
end
