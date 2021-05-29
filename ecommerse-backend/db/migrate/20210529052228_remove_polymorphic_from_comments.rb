class RemovePolymorphicFromComments < ActiveRecord::Migration[6.0]
  def change
  	remove_column :comments, :commentable_type
  	remove_column :comments, :commentable_id
  end
end
