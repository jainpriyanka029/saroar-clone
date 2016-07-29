# == Schema Information
#
# Table name: specialists
#
#  id         :integer          not null, primary key
#  name       :string
#  rate       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Specialist < ApplicationRecord

  has_many :project_working_estimate_subworking_specialists
  has_many :project_working_estimate_subworkings, through: :project_working_estimate_subworking_specialists
end
