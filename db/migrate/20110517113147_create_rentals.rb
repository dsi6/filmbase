class CreateRentals < ActiveRecord::Migration
  def self.up
    create_table :rentals do |t|
      t.date :data_start
      t.date :data_finish
      t.integer :country_id
      t.integer :film_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rentals
  end
end
