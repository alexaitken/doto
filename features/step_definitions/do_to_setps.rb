Given /^there are no to do items in the system$/ do
  Todo.delete_all
end

Given /^there are only the following todo items:$/ do |table|
  table.hashes.each do |row|
    Todo.create row
  end
end

When /^I save the todo item$/ do
  click_button "todo_submit"
end

When /^I fill in "([^"]*)" with (\d+) character description$/ do |name, number_of_characters|
  description = random_string(number_of_characters.to_i)
  When %{I fill in "#{name}" with "#{description}"}
end

Then /^todo item "([^"]*)" exists with create time close to now$/ do |item|
  todo = Todo.where(:description => item).first
  todo.should_not be_nil
  todo.created_at should be_close(Time.now, 1.second)
end

Then /^I should see the following in "([^"]*)":$/ do |selector, table|
  table.hashes.each do |row| 
    within(selector) do |content|
      if content.respond_to? :should
        content.should contain(row['item'])
        content.should contain(row['created_at'])
      else
        hc = Webrat::Matchers::HasContent.new(row['item'])
        assert hc.matches?(content), hc.failure_message
        hc = Webrat::Matchers::HasContent.new(row['created_at'])
        assert hc.matches?(content), hc.failure_message
      end
    end
  end
end

Then /^there are (\d+) todos in the system$/ do |todo_count|
  assert Todo.count == todo_count.to_i
end

Then /^I should see "([^"]*)" with a line through it$/ do |todo_item|
   within("tr.completed") do |content|
     if content.respond_to? :should
       content.should contain(todo_item)

     else
       hc = Webrat::Matchers::HasContent.new(row['todo_item'])
       assert hc.matches?(content), hc.failure_message
     end
   end
end

Then /^I should not see "([^"]*)" with a line through it$/ do |todo_item|
   within("tr.completed") do |content|
     if content.respond_to? :should
       content.should_not contain(todo_item)
     else
       hc = Webrat::Matchers::HasContent.new(row['todo_item'])
       assert_not hc.matches?(content), hc.failure_message
     end
   end

end
