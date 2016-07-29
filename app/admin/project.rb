ActiveAdmin.register Project do
  permit_params :id, :company_id, :start_date, :doc_name, :project_name, :end_date, active_project_working_estimate_ids: [], project_working_estimate_attributes: [:id, :working_title]

  collection_action :download_xlsx, method: :get do
    @project = Project.find(params[:id])

    p = Axlsx::Package.new
    wb = p.workbook
    wb.add_worksheet(name: "Work") do |sheet|
     sheet.add_row ['Name of works', 'Specialist Type', 'Specialist Work Hour', 'Specialist Hourly Rate', 'Sub Total']
     Project.all.each do |proj|
       proj.working_estimates.all.each do |pwe|
         sheet.add_row [pwe.working_title], height: 40, sz: 15 , color: '000000' do
          #  pwe.sub_workings.all.each do |sb|
          #    sheet.add_row [sb.sub_working_title, sb.specialists.all.map(&:name).join(","), sb.working_hour, sb.specialists.all.map(&:rate).join(","), sb.sub_total]
          #  end
         end
         #sheet.add_row [nil,nil,"Stage Total Working Hour #{pwe.stage_work_hours}", nil, "Stage Total #{pwe.stage_total} ₽"], height: 25, sz: 15, color: '060b2e'
       end
     end
     #sheet.add_row [nil, nil,  "TOTAL PROJECT HOURS: #{Project.total_hours_of_project}", nil, "PROJECT TOTAL COST: #{Project.total_cost_of_project} ₽"], height: 30, sz: 14, color: '060b2e'

     sheet.add_row ["#{@project.project_name}"]
    end

    send_data p.to_stream.read, type: "application/xlsx", filename: "#{@project.project_name}.xlsx"
  end

  index do
    column :project_name
    column :doc_name
    column :start_date
    column :end_date
    column :companies do |c|
      c.company.name
    end

    column 'View' do |c|
      link_to 'View', admin_project_path(c)
    end

    column 'Download Links' do |c|
      #link_to 'Download', download_xlsx_admin_project_path(id: c.id, format: :xlsx)
      link_to 'Downlaod', download_xlsx_admin_projects_path(id: c.id, filename: "format.xlsx")
    end

    column 'Edit' do |c|
      link_to 'Edit', edit_admin_project_path(c)
    end

    column 'Delete' do |c|
      link_to 'Delete', admin_project_path(c), method: :delete, confirm: 'Are you sure?'
    end
  end

  form partial: 'form'

  controller do
  #  before_action :set_project
  #
    def update
  #     print "smth"
  #     @project.update(params[:project].to_h)
      project_working_estimate_ids = params.require(:project)[:active_project_working_estimate_ids].select(&:present?)

      ProjectWorkingEstimate.where(project_id: params[:id]).where.not(id: project_working_estimate_ids).update_all(active: false)

      ProjectWorkingEstimate.where(id: project_working_estimate_ids).update_all(active: true)

      @project = Project.find(params[:id])

      @project.update(params[:project].to_h)

      redirect_to admin_project_path(params[:id])

     end
  #
  #   private
  #
  #  def set_project
  #    @project = Project.find(params[:id]) if params[:id].present?
  #  end
  end
end
