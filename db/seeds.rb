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

sprint_list = [
  [ "2017 Calendar Weeks 49-50", "2017-07-05", "2017-07-18" ],
  [ "2017 Calendar Weeks 51-52", "2017-07-19", "2017-08-01" ],
  [ "2018 Calendar Weeks 1-2", "2017-08-02", "2017-08-15" ]
]

sprint_list.each do |x, y, z|
  record = Sprint.find_or_initialize_by(name: x)
  record.start_date = y
  record.end_date = z
  record.save!
end

task_list = [
  [ 1, 41877373746, "2017-07-06T03:59:59Z", 19, 1 ],
  [ 2, 49069534069, "2017-07-06T03:59:59Z", 46, 1 ],
  [ 3, 36762812213, "2017-07-06T03:59:59Z", 6.5, 1 ],
  [ 4, 130195603136, "2017-07-06T03:59:59Z", 7, 1 ],
  [ 5, 41877373746, "2017-07-07T03:59:59Z", 46, 1 ],
  [ 6, 49069534069, "2017-07-07T03:59:59Z", 48, 1 ],
  [ 7, 36762812213, "2017-07-07T03:59:59Z", 6.5, 1 ],
  [ 8, 130195603136, "2017-07-07T03:59:59Z", 1, 1 ],
  [ 9, 41877373746, "2017-07-08T03:59:59Z", 74, 1 ],
  [ 10, 49069534069, "2017-07-08T03:59:59Z", 48, 1 ],
  [ 11, 36762812213, "2017-07-08T03:59:59Z", 2, 1 ],
  [ 12, 130195603136, "2017-07-08T03:59:59Z", 1, 1 ],
  [ 13, 41877373746, "2017-07-11T03:59:59Z", 88, 1 ],
  [ 14, 49069534069, "2017-07-11T03:59:59Z", 45, 1 ],
  [ 15, 36762812213, "2017-07-11T03:59:59Z", 1, 1 ],
  [ 16, 130195603136, "2017-07-11T03:59:59Z", 1, 1 ],
  [ 17, 41877373746, "2017-07-12T03:59:59Z", 83, 1 ],
  [ 18, 49069534069, "2017-07-12T03:59:59Z", 0, 1 ],
  [ 19, 36762812213, "2017-07-12T03:59:59Z", 1, 1 ],
  [ 20, 130195603136, "2017-07-12T03:59:59Z", 1, 1 ],
  [ 21, 41877373746, "2017-07-13T03:59:59Z", 70, 1 ],
  [ 22, 49069534069, "2017-07-13T03:59:59Z", 0, 1 ],
  [ 23, 36762812213, "2017-07-13T03:59:59Z", 0, 1 ],
  [ 24, 130195603136, "2017-07-13T03:59:59Z", 1, 1 ],
  [ 25, 41877373746, "2017-07-14T03:59:59Z", 62, 1 ],
  [ 26, 49069534069, "2017-07-14T03:59:59Z", 0, 1 ],
  [ 27, 36762812213, "2017-07-14T03:59:59Z", 2, 1 ],
  [ 28, 130195603136, "2017-07-14T03:59:59Z", 1, 1 ],
  [ 29, 41877373746, "2017-07-15T03:59:59Z", 59, 1 ],
  [ 30, 49069534069, "2017-07-15T03:59:59Z", 0, 1 ],
  [ 31, 36762812213, "2017-07-15T03:59:59Z", 7, 1 ],
  [ 32, 130195603136, "2017-07-15T03:59:59Z", 1, 1 ],
  [ 33, 41877373746, "2017-07-18T03:59:59Z", 54, 1 ],
  [ 34, 49069534069, "2017-07-18T03:59:59Z", 0, 1 ],
  [ 35, 36762812213, "2017-07-18T03:59:59Z", 7, 1 ],
  [ 36, 130195603136, "2017-07-18T03:59:59Z", 1, 1 ],
  [ 37, 41877373746, "2017-07-19T03:59:59Z", 27, 1 ],
  [ 38, 49069534069, "2017-07-19T03:59:59Z", 0, 1 ],
  [ 39, 36762812213, "2017-07-19T03:59:59Z", 7, 1 ],
  [ 40, 130195603136, "2017-07-19T03:59:59Z", 1, 1 ]
]

task_list.each do |w, x, y, z, a|
  record = Task.find_or_initialize_by(id: w)
  record.project_id = x
  record.historical_date = y
  record.task_hours = z
  record.sprint_id = a
  record.save!
end
