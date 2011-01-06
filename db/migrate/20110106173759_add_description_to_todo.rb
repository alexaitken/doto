class AddDescriptionToTodo < ActiveRecord::Migration
  def self.up
    add_column(:todos, :description, :text)
    Todo.reset_column_information
  end

  def self.down
    remove_column(:todos, :description, :text)
    Todo.reset_column_information
  end
end
