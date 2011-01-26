Given /^that project has a ticket:$/ do |table|
  table.hashes.each do |attributes|
    t = Ticket.create!(attributes)
    @project.tickets << t
  end
end

Given /^"([^\"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    t = Ticket.create!(attributes.merge!(:user => User.find_by_email(email) ))
    @project.tickets << t
  end
end

