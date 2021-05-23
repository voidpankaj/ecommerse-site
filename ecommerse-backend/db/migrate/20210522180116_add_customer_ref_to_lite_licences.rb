class AddCustomerRefToLiteLicences < ActiveRecord::Migration[6.0]
  def change
    add_reference :lite_licences, :customer, null: false, foreign_key: true
  end
end
