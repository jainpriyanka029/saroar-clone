# == Schema Information
#
# Table name: sub_workings
#
#  id           :integer          not null, primary key
#  title        :string
#  working_hour :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class SubWorking < ApplicationRecord
  has_many :project_working_estimate_subworkings
  has_many :project_working_estimates, through: :project_working_estimate_subworkings
end
