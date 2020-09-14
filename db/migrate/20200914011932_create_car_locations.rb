class CreateCarLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :car_locations do |t|
      t.text :location, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
