Given /a proper jobs page is set up/ do
  @order = User.create!({:email => 'matt@admin.com',
                :password => '12345678',
                :school => 'Torrey Pines',
                :user_type => 'school'}).jobs.create(school: "n,a", title: "teacher", job_description: "man", compensation_max: "80000", compensation_min: "8000", expiration: "2018-10-22", fte: "something")
  end
Given /the following job openings exist/ do |jobs_table|
  jobs_table.hashes.each do |job|
    Job.create!(job)
  end
end

Given /the following resumes exist/ do |jobs_table|
  jobs_table.hashes.each do |job|
    Resume.create!(job)
  end
end

Given /the following users exist/ do |jobs_table|
  jobs_table.hashes.each do |job|
    User.create!(job)
  end
end

Given /I am the admin/ do
  visit '/jobs'
end

Then /the title for "([^"]*)" should be "([^"]*)"$/ do |school, position|
  expect(Job.find_by(school: school).title).to eq(position)
end

Then /the compensation_min for "([^"]*)" should be "([^"]*)"$/ do |school, comp|
  expect(Job.find_by(school: school).compensation_min).to eq(comp)
end

Then /the job description for "([^"]*)" should be "([^"]*)"$/ do |school, sum|
  expect(Job.find_by(school: school).job_description).to eq(sum)
end

When(/^I edit the job for the school "(.*?)"$/) do |school|
  find('tr', text: school).click_link("Edit")
end

When(/^I delete the job for the school "(.*?)"$/) do |school|
  find('tr', text: school).click_link("Destroy")
end

Given /^I am logged in as a regular user$/ do
  fail "Unimplemented"
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  regexp = /#{e1}.*#{e2}/m 
  index1 = (page.body =~ /#{e1}/)
  index2 = (page.body =~ /#{e2}/)
  expect(index1).to be < index2
end

When /^I am logged in as "([^"]*)" with password "([^"]*)"$/ do |email, password|
  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end

