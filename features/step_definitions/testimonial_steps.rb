Given /^I have no testimonials$/ do
  Testimonial.delete_all
end

Given /^I have a testimonial by "?([^"]*)"? saying "?([^"]*)"?$/ do |name, quote|
  Testimonial.create(:name => name, :quote => quote)
end

Given /^I have a testimonial by "?([^"]*)"? from "?([^"]*)"? saying "?([^"]*)"?$/ do |name, company, quote|
  Testimonial.create(
    :name => name, :company => company, :quote => quote
  )
end

Then /^I should have ([0-9]+) testimonials?$/ do |count|
  Testimonial.count.should == count.to_i
end
