class RemoveRecipientIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :recipient_id, :string
  end
end
