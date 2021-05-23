class CreateLiteLicences < ActiveRecord::Migration[6.0]
  def change
    create_table :lite_licences do |t|
    	t.datetime :expiry_date
      t.timestamps
    end
  end
end
