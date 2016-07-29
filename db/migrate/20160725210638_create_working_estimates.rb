class CreateWorkingEstimates < ActiveRecord::Migration[5.0]
  def change
    create_table :working_estimates do |t|
      t.string :working_title

      t.timestamps
    end
  end
end
