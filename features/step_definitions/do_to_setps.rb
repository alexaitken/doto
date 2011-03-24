Given /^there are no todo items$/ do
  delete_all_todos
end

Then /^table should match:$/ do |expected_table|
  expected_table.diff!(find_todo_rows)
end

Then /^the todo list should have the message "([^\"]*)"/ do |message|
  find_message.should =~ /#{message}/
end