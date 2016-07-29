# == Schema Information
#
# Table name: working_estimates
#
#  id            :integer          not null, primary key
#  working_title :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class WorkingEstimate < ApplicationRecord
  include DeepClone
  
  has_many :project_working_estimates
  has_many :projects, through: :project_working_estimates

  after_update :update_project_estimates
  after_create :append_project_estimates

  def update_project_estimates
    ProjectWorkingEstimate.where(working_estimate_id: id).update_all(working_title: working_title)
  end

  def append_project_estimates
    Project.all.each do |project|
      project.project_working_estimates.create(project: project, working_estimate_id: id)
    end
  end
end
