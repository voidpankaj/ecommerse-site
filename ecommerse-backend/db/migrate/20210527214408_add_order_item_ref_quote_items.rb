class AddOrderItemRefQuoteItems < ActiveRecord::Migration[6.0]
  def change
  	add_reference :quote_items, :order_item, null: false, foreign_key: true
  end
end
