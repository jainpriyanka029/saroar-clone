# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')


["Design", "iOS Application Development", "Research and design", "ANDROID APPLICATIONS DEVELOPMENT"].each do |we|
  WorkingEstimate.find_or_create_by(working_title: we)
end


SubWorking.find_or_create_by(title: 'Design research', working_hour: 24)
SubWorking.find_or_create_by(title: 'Interaction design (IxD)', working_hour: 24)
SubWorking.find_or_create_by(title: 'Elaboration of scenarios (Use Flow)', working_hour: 24)
SubWorking.find_or_create_by(title: 'Interface Design (Wireframe)', working_hour: 24)

SubWorking.find_or_create_by(title: 'Development of visual concept', working_hour: 24)
SubWorking.find_or_create_by(title: 'Development Style Guide on the approved concept', working_hour: 24)
SubWorking.find_or_create_by(title: 'Illustrations, icons, animations', working_hour: 24)
SubWorking.find_or_create_by(title: 'Adapting the design of Android', working_hour: 24)


Specialist.find_or_create_by(name: 'IOS Developer', rate: 2400)
Specialist.find_or_create_by(name: 'UI designer', rate: 2400)
Specialist.find_or_create_by(name: 'Illustrator', rate: 2400)
Specialist.find_or_create_by(name: 'Motion designer', rate: 2400)
Specialist.find_or_create_by(name: 'Art Director', rate: 2400)
Specialist.find_or_create_by(name: 'UX designer', rate: 2400)
Specialist.find_or_create_by(name: 'ANDROID', rate: 2400)


Company.find_or_create_by(name: "firstCompany")