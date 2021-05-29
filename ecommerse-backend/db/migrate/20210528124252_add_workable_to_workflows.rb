class AddWorkableToWorkflows < ActiveRecord::Migration[6.0]
  def change
    add_reference :workflows, :workable, polymorphic: true, null: false
  end
end
