Given /the following job openings exist/ do |jobs_table|
  jobs_table.hashes.each do |job|
    Job.create!(job)
  end
end

Then /the title for "([^"]*)" should be "([^"]*)"$/ do |school, position|
  expect(Job.find_by(school: school).title).to eq(position)
end

Then /the compensation_min for "([^"]*)" should be "([^"]*)"$/ do |school, comp|
  expect(Job.find_by(school: school).compensation_min).to eq(comp)
end