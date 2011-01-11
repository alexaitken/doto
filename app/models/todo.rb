class Todo < ActiveRecord::Base
  validates_length_of :description, :within => 1..500
end
