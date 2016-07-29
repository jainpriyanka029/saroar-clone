class AddDraftToWorkingEstimates < ActiveRecord::Migration[5.0]
  def change
    add_column :working_estimates, :draft, :boolean,default: false
  end
end
