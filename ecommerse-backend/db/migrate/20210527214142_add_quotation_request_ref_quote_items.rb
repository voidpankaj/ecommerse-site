class AddQuotationRequestRefQuoteItems < ActiveRecord::Migration[6.0]
  def change
  	add_reference :quote_items, :quotation_request, null: false, foreign_key: true
  end
end
