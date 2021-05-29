class AddSendToQuotationRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :quotation_requests, :send_to, :integer
  end
end
