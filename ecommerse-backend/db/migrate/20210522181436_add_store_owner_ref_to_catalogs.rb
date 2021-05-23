class AddStoreOwnerRefToCatalogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :catalogs, :store_owner, null: false, foreign_key: true
  end
end
