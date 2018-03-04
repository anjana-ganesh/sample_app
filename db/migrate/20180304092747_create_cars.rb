class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.string :registration_number
      t.string :colour

      t.timestamps
    end
  end
end
