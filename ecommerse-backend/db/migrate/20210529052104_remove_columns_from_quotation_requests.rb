class RemoveColumnsFromQuotationRequests < ActiveRecord::Migration[6.0]
  def change
  	remove_column :quotation_requests, :initiated_by
  	remove_column :quotation_requests, :send_to
  	remove_column :quotation_requests, :workflow_id
  end
end
