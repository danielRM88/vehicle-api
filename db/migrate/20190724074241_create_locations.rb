class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.references :vehicle, index: true, foreign_key: true, null: false
      t.float :lat, null: :false
      t.float :lng, null: :false
      t.timestamp :at, null: :false

      t.timestamps
    end
  end
end
