class AddPurchaseRefToOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_items, :purchase, null: false, foreign_key: true
  end
end
