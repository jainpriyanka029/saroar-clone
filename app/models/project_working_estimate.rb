# == Schema Information
#
# Table name: project_working_estimates
#
#  id                  :integer          not null, primary key
#  working_estimate_id :integer
#  project_id          :integer
#  working_title       :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class ProjectWorkingEstimate < ApplicationRecord
  belongs_to :working_estimate
  belongs_to :project

  has_many :project_working_estimate_subworkings
  has_many :sub_workings, through: :project_working_estimate_subworkings

  before_create :set_title

  private

  def set_title
    self.working_title = self.working_estimate.working_title
  end
end
