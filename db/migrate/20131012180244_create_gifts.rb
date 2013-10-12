class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :sender
      t.string :receiver
      t.string :amount
      t.string :title
      t.boolean :charity
      t.datetime :sent_time
      t.datetime :claim_time

      t.timestamps
    end
  end
end
