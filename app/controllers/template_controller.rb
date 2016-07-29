class TemplateController < ApplicationController
  layout nil

  def estimate
    @est = ProjectWorkingEstimate.find(params[:id])

  end

  def estimate_subworking
    @sub = ProjectWorkingEstimateSubworking.find(params[:id])
  end

  def estimate_subworking_specialist
    @specialist = ProjectWorkingEstimateSubworkingSpecialist.find(params[:id])
  end
end
