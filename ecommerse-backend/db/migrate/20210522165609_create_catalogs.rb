class CreateCatalogs < ActiveRecord::Migration[6.0]
  def change
    create_table :catalogs do |t|
    	t.string :title
      t.string :price

      t.timestamps
    end
  end
end
