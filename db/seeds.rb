# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = [{:email => 'mattjoseph@berkeley.edu', :password => 'hahahahaa', :user_type => 'admin'},
         {:email => 'candidate@berkeley.edu', :password => 'hahahahaa', :user_type => 'candidate'},
         {:email => 'school@berkeley.edu', :password => '12345678', :user_type => 'school', school: 'Berkeley School'},
         {email: 'hihihi@hi.com', password: 123123123, user_type: 'school', school: 'Hart School'},
         {email: 'hehe@he.com', password: 145145145, user_type: 'school', school: 'Academy of Arts'}]

users.each do |user|
    User.create!(user)
end
