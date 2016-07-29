class CreateProjectWorkingEstimateSubworkings < ActiveRecord::Migration[5.0]
  def change
    create_table :project_working_estimate_subworkings do |t|
      t.references :project_working_estimate, foreign_key: true, index: {:name => "p_w_e"}
      t.references :sub_working, foreign_key: true, index: {:name => "s_w"}
      t.string :sub_working_title
      t.string :sub_working_hour

      t.timestamps
    end
  end
end
