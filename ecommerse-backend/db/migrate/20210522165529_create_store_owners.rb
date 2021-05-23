class CreateStoreOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :store_owners do |t|

      t.timestamps
    end
  end
end
