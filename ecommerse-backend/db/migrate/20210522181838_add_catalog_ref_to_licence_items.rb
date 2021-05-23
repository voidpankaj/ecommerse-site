class AddCatalogRefToLicenceItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :licence_items, :catalog, null: false, foreign_key: true
  end
end
