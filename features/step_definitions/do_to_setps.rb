Given /^there are no to do items in the system$/ do
  Todo.delete_all
end

Given /^there are only the following todo items:$/ do |table|
  table.hashes.each do |row|
    Todo.create :description => row[:item], :created_at => row[:created_at]
  end
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