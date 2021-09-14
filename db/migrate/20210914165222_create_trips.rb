class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.date :date
      t.decimal :distance
      t.decimal :price_subunit
      t.string :start_address
      t.string :destination_address

      t.timestamps
    end
  end
end
