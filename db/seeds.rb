# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

program_list = [
  "Rally",
  "JIRA"
]

program_list.each do |x|
  record = Program.find_or_initialize_by(name: x)
  record.save!
end

project_list = [
  [ 41877373746, "CA Web App", 1 ],
  [ 49069534069, "TCC", 1 ],
  [ 36762812213, "onTrack", 1 ],
  [ 130195603136, "CA Analytics", 1 ]
]

project_list.each do |x, y, z|
  record = Project.find_or_initialize_by(assigned_id: x)
  record.name = y
  record.program_id = z
  record.save!
end
