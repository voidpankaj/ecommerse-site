class AddLiteLicenceRefToLicenceItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :licence_items, :lite_licence, null: false, foreign_key: true
  end
end
