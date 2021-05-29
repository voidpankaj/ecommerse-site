class CreateQuoteItems < ActiveRecord::Migration[6.0]
  def change
    create_table :quote_items do |t|
      t.integer :quantity
      t.float :price
      t.float :quote_price

      t.timestamps
    end
  end
end
