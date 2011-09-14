class CreateBoxOffices < ActiveRecord::Migration
  def self.up
    create_table :box_offices do |t|
      t.integer :rental_id
      t.integer :number_week
      t.integer :sum_all

      t.timestamps
    end
  end

  def self.down
    drop_table :box_offices
  end
end
