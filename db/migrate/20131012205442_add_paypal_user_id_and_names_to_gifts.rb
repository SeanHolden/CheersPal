class AddPaypalUserIdAndNamesToGifts < ActiveRecord::Migration
  def change
    remove_column :gifts, :sender, :string
    remove_column :gifts, :receiver, :string
    remove_column :gifts, :user_id
    add_column :gifts, :sender_id, :string
    add_column :gifts, :sender_firstname, :string
    add_column :gifts, :sender_lastname, :string
    add_column :gifts, :receiver_id, :string
    add_column :gifts, :receiver_firstname, :string
    add_column :gifts, :receiver_lastname, :string
  end
end
