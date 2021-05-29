class CreateQuotationRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :quotation_requests do |t|
      t.string :status
      t.string :initiated_by

      t.timestamps
    end
  end
end
