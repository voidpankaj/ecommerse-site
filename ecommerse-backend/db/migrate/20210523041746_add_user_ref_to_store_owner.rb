class AddUserRefToStoreOwner < ActiveRecord::Migration[6.0]
  def change
    add_reference :store_owners, :user, null: false, foreign_key: true
  end
end
