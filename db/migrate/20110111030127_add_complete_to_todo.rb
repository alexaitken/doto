class AddCompleteToTodo < ActiveRecord::Migration
  def self.up
    add_column(:todos, :completed, :boolean)
    Todo.reset_column_information
    Todo.update_all(:completed => false)
  end

  def self.down
    remove_column(:todos, :completed)
    Todo.reset_column_information
  end
end
