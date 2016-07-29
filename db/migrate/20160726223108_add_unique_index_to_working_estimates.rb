class AddUniqueIndexToWorkingEstimates < ActiveRecord::Migration[5.0]
  def change
    add_index :project_working_estimates, [:project_id, :working_estimate_id], unique: true, name: "unique_p_w_e_index"
  end
end
