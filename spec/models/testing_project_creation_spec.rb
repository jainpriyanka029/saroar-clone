require 'rails_helper'

RSpec.describe Project, type: :model do

  before :each do
    @user = build(:user)
    @company = build(:company)
    @project = build(:project)
    @sub_working = build(:sub_working)
    @specialist = build(:specialist)
    @project_working_estimate = build(:project_working_estimate)
    @project_working_estimate_subworking_specialist = build(:project_working_estimate_subworking_specialist)
    @project_working_estimate_subworking = build(:project_working_estimate_subworking)
  end

  it "should create project_working_estimate" do


    @project_working_estimate.should_not be_nil
  end


  it "should create project_working_estimate_subworking_specialists" do


    @project_working_estimate_subworking_specialist.should_not be_nil
  end


  it "should create project_working_estimate_subworkings" do


    @project_working_estimate_subworking.should_not be_nil
  end

  it 'should list all data' do
    print @project.working_estimates
  end

end