class CreateSubWorkings < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_workings do |t|
      t.string :title
      t.integer :working_hour

      t.timestamps
    end
  end
end
