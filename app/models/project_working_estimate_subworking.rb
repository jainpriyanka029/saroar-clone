# == Schema Information
#
# Table name: project_working_estimate_subworkings
#
#  id                          :integer          not null, primary key
#  project_working_estimate_id :integer
#  sub_working_id              :integer
#  sub_working_title           :string
#  sub_working_hour            :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

class ProjectWorkingEstimateSubworking < ApplicationRecord
  belongs_to :project_working_estimate
  belongs_to :sub_working

  has_many :project_working_estimate_subworking_specialists
  has_many :specialists, through: :project_working_estimate_subworking_specialists

  before_create :set_default_data

  private
  def set_default_data
    self.sub_working_title = self.sub_working.title
    self.sub_working_hour = self.sub_working.working_hour
  end
end
