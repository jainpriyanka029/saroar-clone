# == Schema Information
#
# Table name: project_working_estimate_subworking_specialists
#
#  id                                     :integer          not null, primary key
#  project_working_estimate_subworking_id :integer
#  specialist_id                          :integer
#  specialist_name                        :string
#  specialist_rate                        :integer
#  created_at                             :datetime         not null
#  updated_at                             :datetime         not null
#

class ProjectWorkingEstimateSubworkingSpecialist < ApplicationRecord
  belongs_to :project_working_estimate_subworking
  belongs_to :specialist

  before_create :set_default_data

  private
  def set_default_data
    self.specialist_name = self.specialist.name
    self.specialist_rate = self.specialist.rate
  end
end
