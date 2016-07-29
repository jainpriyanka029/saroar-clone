class AddActiveToProjectWorkingEstimates < ActiveRecord::Migration[5.0]
  def change
    add_column :project_working_estimates, :active, :boolean, default: false, null: false
  end
end
