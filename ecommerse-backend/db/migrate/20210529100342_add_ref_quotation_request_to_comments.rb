class AddRefQuotationRequestToComments < ActiveRecord::Migration[6.0]
  def change
		add_reference :comments, :quotation_request, foreign_key: true
  end
end
