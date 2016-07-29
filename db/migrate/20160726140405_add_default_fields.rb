class AddDefaultFields < ActiveRecord::Migration[5.0]
  def change
    add_column :working_estimates, :default_sw_ids, :integer, default: [], null: false, array: true

    add_column :sub_workings, :default_sp_ids, :integer, default: [], null: false, array: true

  end
end
