class CreateProjectWorkingEstimateSubworkingSpecialists < ActiveRecord::Migration[5.0]
  def change
    create_table :project_working_estimate_subworking_specialists do |t|
      t.references :project_working_estimate_subworking, foreign_key: true, index: {:name => "p_w_e_s"}
      t.references :specialist, foreign_key: true, index: {:name => "specialists_ind"}
      t.string :specialist_name
      t.integer :specialist_rate

      t.timestamps
    end
  end
end
