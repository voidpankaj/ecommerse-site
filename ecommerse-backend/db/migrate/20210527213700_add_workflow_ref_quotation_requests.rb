class AddWorkflowRefQuotationRequests < ActiveRecord::Migration[6.0]
  def change
  	add_reference :quotation_requests, :workflow, null: false, foreign_key: true
  end
end
