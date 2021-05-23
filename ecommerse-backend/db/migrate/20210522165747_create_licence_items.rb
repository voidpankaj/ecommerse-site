class CreateLicenceItems < ActiveRecord::Migration[6.0]
  def change
    create_table :licence_items do |t|

      t.timestamps
    end
  end
end
