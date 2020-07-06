class CreatePrivateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :private_messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.text :message_content
      t.timestamps
    end
  end
end
