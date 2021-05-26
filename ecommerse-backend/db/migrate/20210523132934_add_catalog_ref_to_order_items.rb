class AddCatalogRefToOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_items, :catalog, null: false, foreign_key: true
  end
end
