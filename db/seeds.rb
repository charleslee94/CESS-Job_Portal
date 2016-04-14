# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = [{:email => 'mattjoseph@berkeley.edu', :password => 'hahahahaa', :user_type => 'admin'},
         {:email => 'candidate@berkeley.edu', :password => 'hahahahaa', :user_type => 'candidate'}]

users.each do |user|
    User.create!(user)
end