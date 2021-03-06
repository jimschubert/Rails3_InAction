Given /^the following projects:$/ do |projects|
  Projects.create!(projects.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) projects$/ do |pos|
  visit projects_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following projects:$/ do |expected_projects_table|
  expected_projects_table.diff!(tableish('table tr', 'td,th'))
end

Given /^there is a project called "([^\"]*)"$/ do |name|
  @project =  Factory.create(:project, :name => name)
end
