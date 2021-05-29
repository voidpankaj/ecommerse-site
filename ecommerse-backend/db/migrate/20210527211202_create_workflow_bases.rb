class CreateWorkflowBases < ActiveRecord::Migration[6.0]
  def change
    create_table :workflows do |t|
    	t.string :status
    	t.string :type
      t.timestamps
    end
  end
end
