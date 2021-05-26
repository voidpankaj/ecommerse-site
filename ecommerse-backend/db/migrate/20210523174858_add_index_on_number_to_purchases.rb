class AddIndexOnNumberToPurchases < ActiveRecord::Migration[6.0]
  def change
  	add_index :purchases, :number, unique: true
  end
end
