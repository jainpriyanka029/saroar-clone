# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  start_date   :date
#  doc_name     :string
#  project_name :string
#  end_date     :date
#  company_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Project < ApplicationRecord
  belongs_to :company

  has_many :project_working_estimates
  has_many :working_estimates, through: :project_working_estimates

  accepts_nested_attributes_for :working_estimates, allow_destroy: true

  def active_project_working_estimate_ids
    project_working_estimates.where(active: true).pluck(:id)
  end

  def active_project_working_estimate_ids=(val)
    project_working_estimates.where(id: val).update_all(active: true)
    project_working_estimates.where.not(id: val).update_all(active: false)
  end

  after_create :create_defaults

  def create_defaults
    WorkingEstimate.all.each { |w_e| ProjectWorkingEstimate.create(working_estimate_id: w_e.id, project_id: id) }
  end
end
