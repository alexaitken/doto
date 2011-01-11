module DataCreation
  def random_string(number_of_characters)
    o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten;  
    string  =  (0..number_of_characters).map{ o[rand(o.length)]  }.join;
  end
  
end

World(DataCreation)