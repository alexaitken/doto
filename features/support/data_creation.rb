module DataCreation
  def random_string(number_of_characters)
    o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten;  
    string  =  (0..number_of_characters).map{ o[rand(o.length)]  }.join;
  end
  
  def delete_all_todos
    Todo.delete_all
  end  
  
  def create_todo(description, created)
    Todo.create(:description => description, :created_at => created)
  end

  

end

World(DataCreation)