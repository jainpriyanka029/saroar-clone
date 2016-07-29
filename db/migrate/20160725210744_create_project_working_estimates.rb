class CreateProjectWorkingEstimates < ActiveRecord::Migration[5.0]
  def change
    create_table :project_working_estimates do |t|
      t.references :working_estimate, foreign_key: true
      t.references :project, foreign_key: true
      t.string :working_title

      t.timestamps
    end
  end
end
