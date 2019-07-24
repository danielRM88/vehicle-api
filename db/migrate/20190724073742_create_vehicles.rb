class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.uuid :vehicle_id, null: :false

      t.timestamps
    end
  end
end
