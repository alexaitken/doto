module FindItems
  
  def expect_number_of_rows_in_todo_list(number_of_rows)
    page.should have_css("table#todoItems tr", :count=>number_of_rows + 1)
  end
  
  def find_message
    page.find("#todoList").text
    
  end
  
  

end

World(FindItems)