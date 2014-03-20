at_exit do
  Capybara.current_session.driver.quit
end