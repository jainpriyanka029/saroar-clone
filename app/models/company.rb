# == Schema Information
#
# Table name: companies
#
#  id             :integer          not null, primary key
#  name           :string
#  website        :string
#  contact_number :string
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Company < ApplicationRecord
  belongs_to :user
  has_one :projects
end
