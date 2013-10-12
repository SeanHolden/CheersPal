class RemoveTokenAndPaypalIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :token
    remove_column :users, :paypal_user_id
  end
end
