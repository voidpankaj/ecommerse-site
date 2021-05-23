class AddCustomerRefToPurchase < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchases, :customer, null: false, foreign_key: true
  end
end
