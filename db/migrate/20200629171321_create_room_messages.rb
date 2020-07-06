class CreateRoomMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :room_messages do |t|
      t.integer :user_id
      t.integer :room_id
      t.timestamps
    end
  end
end
