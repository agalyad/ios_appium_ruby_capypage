class CreateContactScreen < Capypage::Page
  element :first_name, '//window[1]/tableview[1]/tableview[1]/cell[1]/textfield[1]',:select_using => :xpath
  element :last_name, '//window[1]/tableview[1]/tableview[1]/cell[1]/textfield[2]',:select_using => :xpath
  element :done, 'Done'
end