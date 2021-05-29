class AddRefCustomerAndOwnerToQuotationRequests < ActiveRecord::Migration[6.0]
  def change
  	add_reference :quotation_requests, :customer, foreign_key: true
  	add_reference :quotation_requests, :store_owner, foreign_key: true
  end
end
