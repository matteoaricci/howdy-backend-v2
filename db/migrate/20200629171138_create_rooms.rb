class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :topic
      t.timestamps
    end
  end
end
