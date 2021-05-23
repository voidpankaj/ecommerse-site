class AddStoreOwnerRefToLiteLicences < ActiveRecord::Migration[6.0]
  def change
    add_reference :lite_licences, :store_owner, null: false, foreign_key: true
  end
end
