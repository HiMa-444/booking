class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :room_introduce
      t.string :room_detail
      t.integer :room_much
      t.string :address

      t.timestamps
    end
  end
end
