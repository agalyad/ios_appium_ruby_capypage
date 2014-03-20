When /^i click on (Create New Contact|Display Picker)$/ do|field|
  home_screen.send(field.downcase.gsub(' ','_')).click
end

When /^i enter "([^"]*)" as the (first name|last name)$/ do |name,field|
  create_contact_screen.send(field.gsub(' ','_')).native.send_keys name
end

When /^i click on Done$/ do
  create_contact_screen.done.click
end

Then /^i am in the Home screen$/ do
  expect(home_screen.create_new_contact).to be_visible
end

When /^i see "([^"]*)" in contacts list$/ do |exp_text|
  expect(contacts_screen).to have_selector(exp_text)
end