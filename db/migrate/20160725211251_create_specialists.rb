class CreateSpecialists < ActiveRecord::Migration[5.0]
  def change
    create_table :specialists do |t|
      t.string :name
      t.integer :rate

      t.timestamps
    end
  end
end
