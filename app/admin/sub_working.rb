ActiveAdmin.register SubWorking do
  permit_params :id, :title, :working_hour, default_sp_ids: []

  form do |f|
    f.inputs 'Create Sub Working' do
      f.input :title
      f.input :working_hour

      f.input :default_sp_ids, :as=>:check_boxes, collection: Specialist.all.map { |i| [i.name, i.id] }

      f.actions
    end
  end
end
