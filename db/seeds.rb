# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Job.create(school: "Ashley Falls")
Job.create(school: "Torrey Pines", title: "Teacher", summary: "This job rocks!", compensation_min: "100,000", compensation_max: "120,000")
