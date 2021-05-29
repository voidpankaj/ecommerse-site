class AddSendIdAndReceiverIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :send_user_id, :integer
    add_column :comments, :receiver_user_id, :integer
  end
end
