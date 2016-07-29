class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.date :start_date
      t.string :doc_name
      t.string :project_name
      t.date :end_date
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
