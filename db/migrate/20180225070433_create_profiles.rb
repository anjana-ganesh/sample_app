class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :age
      t.string :sex
      t.integer :phone_number

      t.timestamps
    end
  end
end
