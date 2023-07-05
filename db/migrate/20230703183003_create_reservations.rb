class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.date :inday
      t.date :outday
      t.integer :humans
      t.integer :period
      t.integer :pey
      t.integer :room_id

      t.timestamps
    end
  end
end
